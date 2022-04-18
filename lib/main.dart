import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Comfortaa'),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),
                Text("Register", style: TextStyle(fontSize: 30, color: Color(0xFF000000)),),
                SizedBox(height: height * 0.05,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your email"),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!)) {
                            return "Entered name does not correct";
                          } else
                            return null;
                        },
                      ),
                SizedBox(height: height * 0.03,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your password"),
                ),
                SizedBox(height: height * 0.03,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300,50),
                    primary: Colors.black
                  ),
                    onPressed: () => Fluttertoast.showToast(
                      msg: 'Pressed Elevated Button'
                    ),
                    child: Text('Next'))
            ]),
          ),
        )
    );
  }
}
