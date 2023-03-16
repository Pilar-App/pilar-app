import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login - Pilar'),
          actions: [
            IconButton(
              onPressed: (){
                // TODO: sign out
              }, 
              icon: Icon( FontAwesomeIcons.doorOpen ))
          ]
        ),
        body: const Center(
          child: Text('Sign in - Google'),
        ),
      ),
    );
  }
}