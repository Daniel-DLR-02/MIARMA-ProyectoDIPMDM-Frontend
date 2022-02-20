import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(left:0,top:8.0),
                child: Icon(Icons.lock_outlined,size:20),
              ),
              Padding(
                padding: const EdgeInsets.only( left:4.0,top:8),
                child: Text(
                              'deluna.rodan.21',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top:8),
                        child: Icon(Icons.add_box_outlined,size:30),
                      ),
                    ],
                  ))
            ]),
            Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:25,left:5),
                child: Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/avatar.jpg"))),
                        ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:30.0,left:10),
                    child: SizedBox(
                      width:70,
                      child: Flexible(
                        child: Column(
                          children: [
                             Text(
                                            '4',
                                            style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                            Text(
                                            'Publicaciones',
                                            style: TextStyle(
                                                color: Colors.black.withOpacity(.8),
                                                            overflow: TextOverflow.ellipsis,
      
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width:75,
                child: Padding(
                    padding: const EdgeInsets.only(top:30.0,left:10),
                  child: Flexible(
                    child: Column(
                      children: [
                         Text(
                                        '92',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                        Text(
                                        'Seguidores',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.normal,
                                                        overflow: TextOverflow.ellipsis,
      
                                            fontSize: 15,),
                                      ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width:80,
                child: Padding(
                  padding: const EdgeInsets.only(top:30.0,left:10),
                  child: Flexible(
                    child: Column(
                      children: [
                         Text(
                                        '125',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                        Text(
                                        'Siguiendo',
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.normal,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15),
                                      ),
                                      
                      
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name of the user",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.8),)),
                              Text("Seville",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.8),)),
                            ])),
                    const SizedBox(height: 12.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 275.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                width: 2.0,
                                color: Colors.black,
                              ), 
                            ),
                            child: const Text("Editar Perfil",
                                style: TextStyle(
                                    color: Colors.black)),
                          ),
                          const Icon(Icons.expand_more_outlined,
                              color: Colors.black)
                        ]),
                    const SizedBox(height: 24.0),
                    
                    Divider(
                      color: Colors.grey[800],
                      thickness: 2.0,
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
                          width: 150.0,
                          child: Icon(Icons.grid_on_outlined,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 150.0,
                          child: Icon(Icons.portrait_outlined,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    Center(
                        child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.0,
                              color: Colors.black,
                            )),
                        child: const Icon(Icons.photo_camera_outlined,
                            color: Colors.black, size: 40.0),
                      ),
                      const SizedBox(height: 10),
                      const Text("No hay Publicaciones",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ]))
                    
          ],
        ),
        ]
        
      ),
    );
  }
}
