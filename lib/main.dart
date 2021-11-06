import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const FirstFlutterApp());
}

class FirstFlutterApp extends StatelessWidget {
  const FirstFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textFieldController = TextEditingController();

  String? errorText;
  double convertedValue = 0;
  bool isConvertedValueVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Currency Convertor'),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            "http://storage0.dms.mpinteractiv.ro/media/1/1481/22466/17174068/1/5-lei500-teanc-imprastiat.jpg",
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
                start: 12.0, top: 6.0, end: 12.0, bottom: 10.0),
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              controller: textFieldController,
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
                errorText: errorText,
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'CONVERT!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white54,
            ),
            onPressed: handleConvertButtonClicked,
          ),
          Visibility(
            child: Text(
              convertedValue.toStringAsFixed(2) + ' RON',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.grey,
              ),
            ),
            visible: isConvertedValueVisible,
          ),
        ],
      ),
    );
  }

  void handleConvertButtonClicked() {
    final String textInputValue = textFieldController.text;
    final double? parsedValue = double.tryParse(textInputValue);

    if (parsedValue == null) {
      setState(() {
        errorText = "Not a valid number";
        isConvertedValueVisible = false;
      });
    } else {
      setState(() {
        errorText = null;
        convertedValue = parsedValue * 4.9;
        isConvertedValueVisible = true;
      });
    }
  }
}
