import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miarma_app/ui/menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/image_pick/image_pick_bloc_bloc.dart';
import '../bloc/posts/create/create_post_bloc.dart';
import '../models/posts/post_dto.dart';
import '../repository/PostRepository/post_repository.dart';
import '../repository/PostRepository/post_repository_impl.dart';
import '../repository/constants.dart';
import 'home_screen.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  late PostRepository postRepository;
  final _formKey = GlobalKey<FormState>();
  String filePath = '';
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  bool publicController = true;

  @override
  void initState() {
    postRepository = PostRepositoryImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return CreatePostBloc(postRepository);
        },
        child: _createBody(context));
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<CreatePostBloc, CreatePostState>(
                listenWhen: (context, state) {
              return state is CreatePostSuccessState ||
                  state is CreatePostErrorState;
            }, listener: (context, state) async {
              if (state is CreatePostSuccessState) {
                final prefs = await SharedPreferences.getInstance();
                Navigator.pushNamed(context, '/');
              } else if (state is CreatePostErrorState) {
                _showSnackbar(context, state.message);
              }
            }, buildWhen: (context, state) {
              return state is CreatePostInitialState;
            }, builder: (ctx, state) {
              if (state is CreatePostInitialState) {
                return buildForm(ctx);
              } else {
                return buildForm(ctx);
              }
            })),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildForm(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Form(
        key: _formKey,
        child: SafeArea(
            child: SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 90,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Crear post',
                            style: GoogleFonts.oleoScript(
                              color: Colors.black,
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 40,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: .1,
                            indent: 20,
                            endIndent: 20,
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0),
                                width: deviceWidth - 100,
                                child: TextFormField(
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.person),
                                      suffixIconColor: Colors.white,
                                      hintText: 'Título',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 0),
                                width: deviceWidth - 100,
                                child: TextFormField(
                                  controller: textController,
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.person),
                                      suffixIconColor: Colors.white,
                                      hintText: 'Texto',
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: deviceWidth - 100,
                                child: Row(
                                  children: [
                                    Text("Público:"),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Switch(
                                        value: publicController,
                                        onChanged: (value) {
                                          setState(() {
                                            publicController = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: deviceWidth - 100,
                                child: BlocProvider(
                                  create: (context) {
                                    return ImagePickBlocBloc();
                                  },
                                  child: BlocConsumer<ImagePickBlocBloc,
                                          ImagePickBlocState>(
                                      listenWhen: (context, state) {
                                        return state
                                            is ImageSelectedSuccessState;
                                      },
                                      listener: (context, state) {},
                                      buildWhen: (context, state) {
                                        return state is ImagePickBlocInitial ||
                                            state is ImageSelectedSuccessState;
                                      },
                                      builder: (context, state) {
                                        if (state
                                            is ImageSelectedSuccessState) {
                                          print(
                                              'PATH ${state.pickedFile.path}');
                                          filePath = state.pickedFile.path;
                                          return Column(children: [
                                            Image.file(
                                              File(state.pickedFile.path),
                                              height: 100,
                                            )
                                          ]);
                                        }
                                        return Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.black,
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              ImagePickBlocBloc>(
                                                          context)
                                                      .add(
                                                          const SelectImageEvent(
                                                              ImageSource
                                                                  .gallery));
                                                },
                                                child: const Text(
                                                    'Select Image')));
                                      }),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                final postDto = PostDto(
                                    titulo: titleController.text,
                                    texto: textController.text,
                                    publica: publicController);
                                BlocProvider.of<CreatePostBloc>(context)
                                    .add(DoPostEvent(postDto, filePath));
                              }
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                    top: 30, left: 30, right: 30),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  'Crear Post'.toUpperCase(),
                                  style: const TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    )))));
  }
}
