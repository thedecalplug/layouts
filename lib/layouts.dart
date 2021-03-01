import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List allItems = [];

  TextEditingController _ourController = new TextEditingController();

  // bool _isHidden = true;
  bool _isObscure = true;
  void addItem() {
    setState(() {
      allItems.add(_ourController.text);
      _ourController.text = '';
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Error!"),
          content: new Text("Enter a value"),
          actions: <Widget>[
            new FlatButton(
              color: Colors.black,
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
void _thesetter(){
    setState(() {
      _isObscure = !_isObscure;
    });
}
  // void _togglePasswordView() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('flex'),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Seyitan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: _isObscure,
                  controller: _ourController,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.green,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off
                      ),
                      color: Colors.green,
                      onPressed: () {
                        _thesetter();
                      }
                    )
                    ),
                  ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                      ),
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text(
                          'Submit',
                        ),
                        onPressed: () {
                          if (_ourController.text.isNotEmpty) {
                            addItem();
                          } else
                            _showDialog();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'The Value',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                    minHeight: 200,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in allItems)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.album_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(item),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
