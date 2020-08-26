import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Container(
        decoration:  BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.red,
              offset: Offset.zero,
              blurRadius: 8
            )]
          ),
        child: Text("404"),
        ),
    );
  }
}