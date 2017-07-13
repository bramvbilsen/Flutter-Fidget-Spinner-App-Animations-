import 'package:flutter/material.dart';

import './fidget_spinner_builder.dart' as fidget;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Spin Fidgets, Spin!"),
        bottom: new TabBar(
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.arrow_right)),
            new Tab(icon: new Icon(Icons.arrow_downward)),
            new Tab(icon: new Icon(Icons.arrow_left))
          ],
          controller: _controller,
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new fidget.FidgetSpinner(url: "https://cdn.shopify.com/s/files/1/1663/6213/products/3_1024x1024_3ffffb57-dcf8-4051-8c28-b3046c8a0e72.png?v=1491244603"),
          new fidget.FidgetSpinner(url: "https://www.cleverr.co.za/wp-content/uploads/2017/04/10_e47e1af3-6fef-480d-aa04-7c579e2085f8_530x.png"),
          new fidget.FidgetSpinner(url: "https://lh3.googleusercontent.com/GG1TqJSJbwvDE8dqA86Y_tRfKKR8KXDBQtqZW0v5uOpbhWa0Ryk6XDSlQlrhTbgGuuo=w170")
        ],
      ),
    );
  }
}