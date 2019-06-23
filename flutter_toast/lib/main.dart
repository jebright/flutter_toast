import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Toast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Toast'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _submit() {
    String msg = "Changes saved at " + new DateTime.now().toString();
    SnackBar snackBar = new SnackBar(
      content: new Text(msg),
      action: SnackBarAction(
        label: 'Copy',
        onPressed: () {
          Clipboard.setData(new ClipboardData(text: msg));
          print("Successfully copied " + msg + " to clipboard");
        },
      ),
      backgroundColor: Colors.amber,
      duration: new Duration(seconds: 8),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('My Form'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          autovalidate: true,
          child: new Column(
            children: [
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Enter something'),
              ),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
