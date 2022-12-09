import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate,
                onPressed: onButtonPressed,
              ),
              _Bottom(
                selectedDate: selectedDate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onButtonPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              minimumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _Top({
    required this.selectedDate,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "디데이 계산기",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.calendar_month),
            iconSize: 80,
          )
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final DateTime selectedDate;

  _Bottom({
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "마감일 : ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "D - ${DateTime(
              now.year,
              now.month,
              now.day,
            ).difference(selectedDate).abs().inDays}",
            style: TextStyle(fontSize: 80),
          ),
        ],
      ),
    );
  }
}
