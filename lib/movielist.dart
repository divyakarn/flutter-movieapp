import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Movielist extends StatefulWidget {
  @override
  _MovielistState createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  List data;

//  String apiKey= '869ffcc1b93389593e8971c48a57e27e';

  String url =
      'http://api.themoviedb.org/3/discover/movie?api_key=869ffcc1b93389593e8971c48a57e27e';

  Future<String> getJson() async {
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var extractdata = jsonDecode(response.body);
      data = extractdata['results'];
    });
    print(data[0]['title']);
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    this.getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Moviedb',
          style: new TextStyle(fontSize: 15.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.redAccent),
              accountEmail: new Text('godofthunder@gmail.com'),
            ),
            ListTile(
              title: Text('new Movies'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Most Popular'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Trending'),
              onTap: () {},
            ),
            ListTile(
              title: Text('MostRated'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return ListTile(
            title: new Text(data[i]["title"]),
            subtitle: new Text(data[i]["overview"]),
            leading: new CircleAvatar(
              radius: 5.0,
              backgroundColor: Colors.blue,
            ),
            trailing: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text("Release-Date \n ${data[i]["release_date"]}",
                    style: new TextStyle(color: Colors.green, fontSize: 10.0)),
                new SizedBox(
                  height: 5.0,
                ),
                new Text(
                  "Vote ${data[i]["vote_average"]}",
                  style: new TextStyle(color: Colors.red, fontSize: 15.0),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
