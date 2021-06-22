import 'package:alummahbio/application/models/beneficiary/model.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Beneficiaries model;

  Result({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.firstName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.lastName,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              model.email,
              style: TextStyle(fontSize: 22),
            ),
          ],
        )
      )
    );
  }
}