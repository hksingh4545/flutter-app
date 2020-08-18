import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  TextInputWidget(this.callback);
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

/*
  void changeText(text) {
    if (text == 'Hello World!') {
      controller.clear();
      text = "";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            controller: this.controller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.message), labelText: "Type a message:"),
           // onChanged: (text) => this.changeText(text)),
        //Text(this.text)
      ],
    );
  }*/
  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: "Post Message",
              onPressed: this.click,
            )));
  }
}
