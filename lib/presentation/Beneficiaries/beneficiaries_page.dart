import 'package:flutter/material.dart';

class BeneficiariesPage extends StatefulWidget {
  BeneficiariesPage({Key key}) : super(key: key);

  @override
  _BeneficiariesPageState createState() => _BeneficiariesPageState();
}

class _BeneficiariesPageState extends State<BeneficiariesPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('Beneficiaries'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}