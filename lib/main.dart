import 'package:flutter/material.dart';
import './movielist.dart' as movielist;

void main() {
  runApp(new MaterialApp(
    home: Frontpage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Frontpage extends StatefulWidget {
  @override
  _FrontpageState createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: new Column(
          children: <Widget>[
            new Center(
              child: new Container(
                margin: EdgeInsets.only(top: 280.0),
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                // color: Colors.blue,
                child: new Center(
                  child: new Text(
                    'Moviedb',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 40.0),
              width: 100.0,
              height: 50.0,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: new Text(
                  'Enter',
                  style: new TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return movielist.Movielist();
                  }));
                },
              ),
            )
          ],
        ));
  }
}
