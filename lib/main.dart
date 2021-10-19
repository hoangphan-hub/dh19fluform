import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Interactivity'),
          backgroundColor: Colors.teal[300],
        ),
        // body: DemoTextField(),
        body: DemoSwitch(),
      ),
    );
  }
}

class DemoTextField extends StatefulWidget {
  const DemoTextField({ Key? key }) : super(key: key);

  @override
  _DemoTextFieldState createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late TextEditingController _textController;
  String _text = 'Hello';
  String _textSubmit = 'Hi';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: _textController,
            style: TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _text = text;
              });
            },
          ),
          TextField(
            controller: null,
            style: TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _text = text;
              });
            },
          ),
          TextField(
            controller: null,
            style: TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _text = text;
              });
            },
          ),
          Text(
            'Hello $_text',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _textSubmit = _textController.text;
              });
            }, 
            child: Text(
              'Submit Me',
              style: TextStyle(fontSize: 30),
              ),
          ),
          Text(
            'Hi $_textSubmit',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}


class DemoSwitch extends StatefulWidget {
  const DemoSwitch({ Key? key }) : super(key: key);

  @override
  _DemoSwitchState createState() => _DemoSwitchState();
}

class _DemoSwitchState extends State<DemoSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isOn = false;
  bool _isOnSubmit = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Settings, options, ...',
              style: TextStyle(fontSize: 30),
            ),
            value: _isOn, 
            onChanged: (bool? value) {
              setState(() {
                _isOn = value!;
              });
            }),
          Text(
            'Switch is turned on: $_isOn',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isOnSubmit = _isOn;
              });
            }, 
            child: Text(
              'Submit Me',
              style: TextStyle(fontSize: 30),
              ),
          ),
          Text(
            'Switch is turned on: $_isOnSubmit',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}