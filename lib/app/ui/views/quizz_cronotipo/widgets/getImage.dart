
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/classes/firestore_database.dart';

Widget getImageFromFirebaseStorage(String fileName){
  return FutureBuilder(
      future: FireStoreDataBase().getData(fileName),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong",
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.network(
            snapshot.data.toString(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
}