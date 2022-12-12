import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String camelCase(String kata) {
  // String kata = "muh98ammad saef#%ul3l-*oh";
  //Split By Spasi
  List splitKataBySpasi = kata.split(" ");
  List tamp = [];
  List splitperKata = [];
  String result;
  List hasil = [];
  //Looping List
  for (var i = 0; i < splitKataBySpasi.length; i++) {
    //Remove Character using RegEx
    splitKataBySpasi[i] =
        splitKataBySpasi[i].replaceAll(RegExp('[^A-Za-z]'), '');
    //Split per char
    splitperKata = splitKataBySpasi[i].split("");
    //Change first alphabet in word
    for (var x = 0; x < splitperKata.length; x++) {
      if (x == 0) {
        splitperKata[x] = splitperKata[x].toUpperCase();
      } else {
        splitperKata[x] = splitperKata[x].toLowerCase();
      }
    }

    tamp.add(splitperKata);
    result = tamp[i].join();
    hasil.add(result);

    // stdout.write(result + " ");
  }
  String kataAkhir = hasil.join(" ");
  kata = kataAkhir.toString();
  return kata;
}

class MyApp extends StatelessWidget {
  String data = "";
  final textInputController = TextEditingController();
  final textInputController2 = TextEditingController();
  // const MyApp({Key? key}) : super(key: key);
  // String data = "Muhammad Saefulloh";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Talentport Test - M Saefulloh"),
          ),
          backgroundColor: Color.fromARGB(255, 245, 118, 109),
        ),
        // body: Center(child: Text("This is CamelCase!")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please Input Text :'),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: textInputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 245, 118, 109),
                  ),
                ),
                onPressed: () {
                  data = textInputController.text.toString();
                  // camelCase(data);
                  textInputController2.text = camelCase(data);
                  // data =
                  // print(data);
                },
                child: Text('Click to Justify The Text'),
              ),
              Text("Result :"),
              SizedBox(
                width: 300,
                child: TextField(
                  enabled: false,
                  controller: textInputController2,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(horizontal: 70.0),
                    border: OutlineInputBorder(),
                    // labelText: 'Input Word',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
