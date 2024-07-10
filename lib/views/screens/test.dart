import 'package:flutter/material.dart';

class DynamicContainerScreen extends StatefulWidget {
  @override
  _DynamicContainerScreenState createState() => _DynamicContainerScreenState();
}

class _DynamicContainerScreenState extends State<DynamicContainerScreen> {
  List<Widget> containers = [];

  void _addContainer() {
    setState(() {
      containers.add(
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          color: Colors.blue,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Containers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...containers,
            ElevatedButton(
              onPressed: _addContainer,
              child: Text('Add More'),
            ),
          ],
        ),
      ),
    );
  }
}