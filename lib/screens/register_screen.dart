import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
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
                            'Miarmapp',
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
                                padding: EdgeInsets.all(5),
                              ),
                              SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Nick',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Nombre',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: const TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Contraseña',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: const TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Confirmar contraseña',
                                    ),
                                  ),
                                ),
                              ),

                              /*SizedBox(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Avatar',
                                    ),
                                  ),
                                ),
                              ),*/

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: TextField(
                                  controller:
                                      dateinput, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText:
                                          "Fecha de nacimiento" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                                height: 50,
                                width: deviceWidth,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextButton(
                                  child: const Text('Registrarte',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                )),
                          ),
                          Row(
                            children: <Widget>[
                              const Text('¿Tienes ya una cuenta?'),
                              TextButton(
                                child: const Text(
                                  'Inicia sesión',
                                  style: TextStyle(fontSize: 12),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    )))));
  }
}
