//import 'dart:html';

//import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
//! Done Screen G.Doc

class CobaDatePickerCupertino extends StatefulWidget {
  const CobaDatePickerCupertino({Key? key}) : super(key: key);

  @override
  State<CobaDatePickerCupertino> createState() =>
      _CobaDatePickerCupertinoState();
}

class _CobaDatePickerCupertinoState extends State<CobaDatePickerCupertino> {
  //DateTime _dateNow = DateTime.now();
  DateTime _dateNow = DateTime(1990);
  final List<DateTime> _dateAvailable = [
    //TIPS:DateTime(tahun,bulan,tanggal)
    DateTime(1990, 1, 1), //firstdate

    DateTime(2022, 6, 22),
    DateTime(2022, 6, 21),

    DateTime(2022, 7, 18),

    DateTime(2022, 7, 1),
    DateTime(2022, 6, 18),
    //DateTime(2022, 6, 20),
    DateTime(2022, 7, 20),

    DateTime(2022, 7, 16),

    DateTime(2022, 7, 17),
    DateTime(2022, 7, 15),
    DateTime(2022, 7, 14),
    DateTime(2022, 7, 19),
    DateTime(2022, 7, 23),
  ];
  //DateTime _dateNow = _dateAvailable[_dateAvailable.length - 1];

  @override
  Widget build(BuildContext context) {
    //NOTE:Sort function
    //_dateAvailable.sort(((a, b) => a.compareTo(b)));
    //END:Sort Function

    //print(_dateAvailable);
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

    DateTime initialDayCustom(List<DateTime> _dateAvailable) {
      DateTime? _selectedDay;
      //DateTime? _selectedDay2;
      DateTime _returnDay = _dateAvailable[0];

      for (var i = 0; i < _dateAvailable.length; i++) {
        if (_dateAvailable.length - i != 1) {
          _selectedDay = _dateAvailable[i + 1];
        } else {
          _selectedDay = _dateAvailable[i];
        }
        //NOTE: abs() for coverting negative to positive
        if (DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                .difference(_returnDay)
                .inDays
                .abs() <=
            DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                .difference(_selectedDay)
                .inDays
                .abs()) {
          _returnDay = _returnDay;
        } else {
          _returnDay = _selectedDay;
        }
        //print(_returnDay);
      }
      return _returnDay;
    }

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pilih Tanggal yang anda ingin pesan"),
              _dateNow != DateTime(1990, 1, 1)
                  ? Text(
                      "Hari: ${hariBahasaIndonesia(DateFormat.EEEE().format(_dateNow))}, tanggal: ${DateFormat.d().format(_dateNow)} ${DateFormat.MMMM().format(_dateNow)} ${DateFormat.y().format(_dateNow)}",
                    )
                  : Text(
                      "Anda belum memilih tanggal",
                      style: TextStyle(
                        color: Colors.red[300],
                      ),
                    ),
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
                  //TIPS: showDatePicker bisa langsung ditampilkan tanpa harus menggunakan showDialog() dan alertDialog()
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Platform.isAndroid
                          ? Theme(
                              //NOTE: ThemeData.dark (- supaya tampilan datepicker jadi dark)
                              data: ThemeData.dark(),
                              child: CupertinoAlertDialog(
                                title: Text(
                                    "Apakah anda yakin untuk memilih tanggal?"),
                                content: Text(
                                    "Pilih tanggal yang sesuai tanggal lahir anda!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                              //color: Colors.white,
                                              height: _bodyHeight * 0.3,

                                              //Note: CupertinoDatePicker()
                                              child: CupertinoDatePicker(
                                                  backgroundColor:
                                                      Colors.white60,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  initialDateTime: initialDayCustom(
                                                      _dateAvailable), //gadiisi pun sudah secara default make date now
                                                  minimumDate: DateTime(1990),
                                                  maximumDate: DateTime(2025),
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
                              ),
                            )
                          : AlertDialog(
                              title: Text(
                                  "Apakah anda yakin untuk memilih tanggal?"),
                              content: Text(
                                  "Pilih tanggal yang sesuai tanggal lahir anda!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    /*print("19 juni");
                                    print(DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day)
                                        .difference(DateTime(2022, 6, 19))
                                        .inDays
                                        .abs());
                                    print(DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day)
                                        .difference(DateTime(2022, 6, 22))
                                        .inDays
                                        .abs());*/
                                    Navigator.pop(context);
                                    //NOTE: showDatePicker()
                                    showDatePicker(
                                      context: context,
                                      initialDate:
                                          initialDayCustom(_dateAvailable),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2025),
                                      helpText: initialDayCustom(
                                                  _dateAvailable) ==
                                              DateTime(
                                                  DateTime.now().year,
                                                  DateTime.now().month,
                                                  DateTime.now().day)
                                          ? "Tanggal Hari ini Tersedia!"
                                          : "Tanggal Hari ini Kosong, kami pilihkan tanggal terdekat)", //text penjelasan di paling atas
                                      cancelText: "batalkan", //cancel text
                                      confirmText: "konfirmasi", //OK text
                                      fieldLabelText:
                                          "Masukkan tanggal pilihan anda", //Enter date pas mau masukkan tanggal secara manual
                                      fieldHintText:
                                          "saya memilih tanggal...", //hint text di textfield ketika masukkan tanggal secara manual
                                      errorFormatText:
                                          "Format tanggal salah", //kalau tanggal manual yang dimasukkan formatnya salah
                                      errorInvalidText:
                                          "tanggal tersebut tidak tersedia jadwal", //kalau tanggal manual yang diketik bukan selectable date
                                      initialEntryMode:
                                          DatePickerEntryMode.calendar,
                                      initialDatePickerMode: DatePickerMode
                                          .day, //year berlaku kalau datepickerentrymode adalah calendar, bukan inputOnly, kalau input masih bisa tapi harus pindah mode dulu

                                      selectableDayPredicate: (day) {
                                        if (_dateAvailable.contains(day)) {
                                          return true;
                                        }

                                        return false;
                                      },

                                      /*selectableDayPredicate: (day) {
                                        if (day.isAfter(DateTime.now()
                                                .subtract(Duration(days: 5))) &&
                                            day.isBefore(DateTime.now()
                                                .add(Duration(days: 5)))) {
                                          return true;
                                        }
                                        return false;
                                      },*/
                                    ).then((value) {
                                      //compare to mendeteksi apakah hari sebelum atau sesudah, tapi return 1 atau -1
                                      /*print(
                                        DateTime.now()
                                            .difference(
                                              DateTime(2022, 9, 1),
                                            )
                                            .inDays,
                                      );*/

                                      //isAfter atau isBefore mendeteksi apakah hari sebelum atau sesudah, tapi return true or false
                                      /*print(
                                        DateTime.now().isAfter(
                                          DateTime(2023),
                                        ),
                                      );*/

                                      if (value != null) {
                                        setState(() {
                                          _dateNow = value;
                                        });
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
                    },
                  );
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
