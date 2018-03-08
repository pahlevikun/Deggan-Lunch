import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Deggan Lunch',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Helvetica Neue',
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Deggan Lunch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          margin:const EdgeInsets.all(10.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: _controller,
                decoration: new InputDecoration(
                  hintText: 'Fill Your Lunch Menu',
                ),
              ),
              new Container(
                margin:const EdgeInsets.only(top : 20.0),
                child: new RaisedButton(
                  padding: new EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if(_controller.text.length<1){
                      scaffoldKey.currentState
                          .showSnackBar(new SnackBar(content: new Text("Please Fill Correctly!")));
                    }else{
                      showDialog(
                        context: context,
                        child: new AlertDialog(
                          title: new Text('What you typed'),
                          content: new Text(_controller.text),
                        ),
                      );
                    }
                  },
                  child: new Text('SEND'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
