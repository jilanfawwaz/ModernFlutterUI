//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class CobaDatePickerCupertino extends StatefulWidget {
  const CobaDatePickerCupertino({Key? key}) : super(key: key);

  @override
  State<CobaDatePickerCupertino> createState() =>
      _CobaDatePickerCupertinoState();
}

class _CobaDatePickerCupertinoState extends State<CobaDatePickerCupertino> {
  DateTime _dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _appBar = AppBar(
      title: Text("Coba Cupertino & Date Picker"),
    );
    final _bodyHeight = _height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    String hariBahasaIndonesia(String hari) {
      if (hari == "Monday") {
        return "Senin";
      } else if (hari == "Tuesday") {
        return "Selasa";
      } else if (hari == "Wednesday") {
        return "Rabu";
      } else if (hari == "Thursday") {
        return "Kamis";
      } else if (hari == "Friday") {
        return "Jum'at";
      } else if (hari == "Saturday") {
        return "Sabtu";
      } else if (hari == "Sunday") {
        return "Minggu";
      } else {
        return "";
      }
    }

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pilih Tanggal Lahir anda"),
              Text(
                  "Hari: ${hariBahasaIndonesia(DateFormat.EEEE().format(_dateNow))}, tanggal: ${DateFormat.d().format(_dateNow)} ${DateFormat.MMMM().format(_dateNow)} ${DateFormat.y().format(_dateNow)}"),
              //NOTE: CalendarDatePicker (- bisa nampilin tanggal tanpa harus pencet button)
              /*CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2025),
                onDateChanged: (value) {},
              ),*/
              //END: CalendarDatePicker

              //NOTE: OutlinedButton()
              OutlinedButton(
                onPressed: () {
                  //NOTE: showDatePicker()
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Platform.isIOS
                            ? CupertinoAlertDialog(
                                title: Text(
                                    "Apakah anda yakin untuk memilih tanggal?"),
                                content: Text(
                                    "Pilih tanggal yang sesuai tanggal lahir anda!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.blue[100],
                                              height: _bodyHeight * 0.3,
                                              child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  initialDateTime:
                                                      DateTime.now(), //gadiisi pun sudah secara default make date now
                                                  onDateTimeChanged: (value) {
                                                    setState(() {
                                                      _dateNow = value;
                                                    });
                                                    //Navigator.pop(context);
                                                  }),
                                            );
                                          });
                                      //Navigator.pop(context);
                                    },
                                    child: Text("YES"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("NO"),
                                  ),
                                ],
                              )
                            : AlertDialog(
                                title: Text(
                                    "Apakah anda yakin untuk memilih tanggal?"),
                                content: Text(
                                    "Pilih tanggal yang sesuai tanggal lahir anda!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: _dateNow,
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2025),
                                      ).then((value) {
                                        if (value != null) {
                                          setState(() {
                                            _dateNow = value;
                                          });
                                          Navigator.pop(context);
                                        }
                                      });
                                    },
                                    child: Text("YES"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("NO"),
                                  ),
                                ],
                              );
                      });
                },
                child: Text("Pilih Tanggal"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
