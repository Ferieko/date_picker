import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}): super(key : key);


@override
State<DatePicker> createState() => _DatePickerState();
}
class _DatePickerState extends State<DatePicker>{
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1800),
                    lastDate: DateTime(DateTime
                        .now()
                        .year + 5))
                    .then((value) {
                  setState(() {
                    _selectedDate = value;
                  });
                });
              },
              child: Text(
                'Tanggal Lahir : ${DateFormat('dd-MMM-yyyy').format(_selectedDate?? DateTime.now())}'
              ),
            )

          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

      // TODO: implement createState
//    throw UnimplementedError();


  }





