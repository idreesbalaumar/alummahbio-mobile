import 'package:flutter/material.dart';

class OrganizationsPage extends StatefulWidget {
  OrganizationsPage({Key key}) : super(key: key);

  @override
  _OrganizationsPageState createState() => _OrganizationsPageState();
}

class _OrganizationsPageState extends State<OrganizationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Organizations'),),
    );
  }
}