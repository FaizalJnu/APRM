import 'package:aprm/constants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'APRM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _classes = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  List<DateTime?> _dates = [];
  String _currClass = "A";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print(size.width);
    }
    List<Widget> submitPanel = [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          underline: Container(),
          borderRadius: BorderRadius.circular(10),
          value: _currClass,
          items: [
            ..._classes.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text("Class $e"),
                );
              },
            )
          ],
          onChanged: (val) {
            if (kDebugMode) {
              print(val);
            }
            setState(() {
              _currClass = val!;
            });
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(onPressed: () {}, child: const Text("Predict")),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (size.width > AppConstants.desktopWidth)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          firstDate: DateTime.now().subtract(Duration(
                              hours: DateTime.now().hour,
                              minutes: DateTime.now().minute)),
                        ),
                        value: _dates,
                        onValueChanged: (dates) {
                          _dates = dates;
                        },
                      ),
                    ),
                    Column(
                      children: submitPanel,
                    ),
                  ],
                ),
              if (size.width <= AppConstants.desktopWidth)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          firstDate: DateTime.now().subtract(Duration(
                              hours: DateTime.now().hour,
                              minutes: DateTime.now().minute)),
                        ),
                        value: _dates,
                        onValueChanged: (dates) {
                          _dates = dates;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: submitPanel,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
