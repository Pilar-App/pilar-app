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
              icon: const Icon( FontAwesomeIcons.doorOpen )),
          ]
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Icon( FontAwesomeIcons.google, color: Colors.white,),
                      Padding(padding: EdgeInsets.all(8)),
                      Text('Sign in with Google', style: TextStyle( color: Colors.white, fontSize: 17),)
                    ],
                  ),
                  onPressed: (){
                    // TODO: Sign in with Google

                  }
                  )
              ],),),
        )

      ),
    );
  }
}