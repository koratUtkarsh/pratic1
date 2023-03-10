import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratic1/cold.dart';
import 'package:pratic1/page.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

        routes: {
        '/':(context) => code(),
          'PAGE':(context) => PAGE(),
      },
  //    home: cold(),
    ),
  );
}