import 'package:flutter/material.dart';

import './fidget_spinner_builder.dart' as fidget;
import './flickable_fidget_spinner_builder.dart' as flickableFidget;

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
  PageController _ccontroller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 3);
    _ccontroller = new PageController();
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
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (int index) {
          _ccontroller.jumpToPage(index);
        },
        items: <BottomNavigationBarItem> [
            new BottomNavigationBarItem(
              title: new Text("First"),
              icon: new Icon(Icons.arrow_right)
            ),
            new BottomNavigationBarItem(
              title: new Text("Second"),
              icon: new Icon(Icons.arrow_downward)
            ),
            new BottomNavigationBarItem(
              title: new Text("Last"),
              icon: new Icon(Icons.arrow_left)
            )
        ],
      ),
      body: new PageView(
        controller: _ccontroller,
        physics: new NeverScrollableScrollPhysics(),
        children: <Widget>[
          new fidget.FidgetSpinner(url: "https://cdn.shopify.com/s/files/1/1663/6213/products/3_1024x1024_3ffffb57-dcf8-4051-8c28-b3046c8a0e72.png?v=1491244603"),
          new flickableFidget.FlickableFidgetSpinner(url: "http://i.imgur.com/yWtJdi9.png"),
          new fidget.FidgetSpinner(url: "https://lh3.googleusercontent.com/GG1TqJSJbwvDE8dqA86Y_tRfKKR8KXDBQtqZW0v5uOpbhWa0Ryk6XDSlQlrhTbgGuuo=w170")
        ],
      )
    );
  }
}