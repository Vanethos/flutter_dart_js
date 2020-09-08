import 'package:flutter/material.dart';
import 'package:flutter_dart_js/bundler/stub_bundler.dart'
    if (dart.library.js) 'package:flutter_dart_js/bundler/javascript_bundler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String camelCase = "";

  TextEditingController _controller = TextEditingController();

  void _showConfirmButton() {
    showConfirm("Hello, this is a confirm");
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => camelCase = toCamelCase(_controller.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tap the button to see a confirm box!',
            ),
            //TextField(
            //  decoration: InputDecoration(
            //      labelText:
            //          "I'll conver things to lowercase using JavaScript!"),
            //  controller: _controller,
            //),
            //Text("camelCase text: ${camelCase.isNotEmpty ? camelCase : 'N/A'}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showConfirmButton,
        tooltip: 'Increment',
        child: Icon(Icons.question_answer),
      ),
    );
  }
}
