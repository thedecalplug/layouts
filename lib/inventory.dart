import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:layouts_app/layouts.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  void initState() {
    super.initState();
    print('calling init state for inventory');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Inventify',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 60),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Layout()));
                },
                child: Column(
                  children: [Icon(Icons.arrow_forward_sharp)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
