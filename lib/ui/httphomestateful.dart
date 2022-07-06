import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/httpgetmodelstateful.dart';
import 'package:modern_flutter_ui/models/httpmodelstateful.dart';

class HttpStateful extends StatefulWidget {
  HttpStateful({Key? key}) : super(key: key);

  @override
  State<HttpStateful> createState() => _HttpStatefulState();
}

class _HttpStatefulState extends State<HttpStateful> {
  TextEditingController nameController = TextEditingController();

  TextEditingController jobController = TextEditingController();

  HttpModelStateful dataApi = HttpModelStateful();

  HttpGetStateful dataApiGet = HttpGetStateful();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //supaya ga bottom overflow saat buka keyboard, tapi kekurangannya textform atau button bisa ketutupan keyboard
      //resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text("Http Stateful"),
      ),
      body: GestureDetector(
        //biar kalau bagian layar yang lain dipencet, textform langsung unfocus
        //behavior: HitTestBehavior.opaque,
        onTap: () {
          //yang ini versi lama
          //FocusScope.of(context).requestFocus(FocusNode());

          //yang ini versi baru, unfocus() adalah method baru dari focusscope
          FocusScope.of(context).unfocus();
        },
        child: Container(
          //supaya colum tetap ditengah layar walaupun di dalam listview atau singlechildscrollview
          alignment: Alignment.center,
          child: ListView(
            //kalau layar didrag, keyboard akan hilang dan form akan unfocus
            //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            //kalau make singlechildscroll view, shrinkwrap auto true
            shrinkWrap: true,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: nameController,
                      textAlign:
                          TextAlign.center, //hint text juga akan terpengaruh
                      cursorColor: Colors.black,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Nama Api",
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        //floating label langsung muncul gaperlu diklik

                        //labelStyle: TextStyle(color: Colors.green),
                        //alignLabelWithHint: true,
                        label: Text("Masukkan nama"),

                        fillColor: Colors.grey[200],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber.shade900),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(40),
                        //   borderSide: BorderSide(
                        //     color: Colors.green,
                        //   ),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: jobController,
                      textAlign:
                          TextAlign.center, //hint text juga akan terpengaruh
                      cursorColor: Colors.black,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Pekerjaan Api",
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        //floating label langsung muncul gaperlu diklik

                        //labelStyle: TextStyle(color: Colors.green),
                        //alignLabelWithHint: true,
                        label: Text("Masukkan Pekerjaan"),

                        fillColor: Colors.grey[200],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber.shade900),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(40),
                        //   borderSide: BorderSide(
                        //     color: Colors.green,
                        //   ),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (nameController.text != "" && jobController != "") {
                        HttpModelStateful.connectApi(
                                nameController.text, jobController.text)
                            .then((value) {
                          setState(() {
                            dataApi = value;
                          });
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            //duration: Duration(microseconds: 1500), //default 4 detik (4000 ms)
                            backgroundColor: Colors.blue.withOpacity(0.8),
                            content: Text(
                              "anda belum memasukkan nama dan pekerjaan",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      nameController.clear();
                      jobController.clear();
                    },
                    child: Text("Input"),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Column(
                    children: [
                      Text("ID : "),
                      Text(dataApi.id == null
                          ? "data id kosong"
                          : "${dataApi.id}"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Nama : "),
                      Text(dataApi.name == null
                          ? "data Nama Kosong"
                          : "${dataApi.name}"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Pekerjaan : "),
                      Text(dataApi.job == null
                          ? "data Pekerjaan kosong"
                          : "${dataApi.job}"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Dibuat pada : "),
                      Text(dataApi.createdAt == null
                          ? "data kosong"
                          : "${dataApi.createdAt}"),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.blue,
                    child: Text(
                      "HTTP GET STATEFUL",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(dataApiGet.imageURL ==
                                null
                            ? "https://i.pinimg.com/736x/65/25/a0/6525a08f1df98a2e3a545fe2ace4be47.jpg"
                            : "${dataApiGet.imageURL}"),
                        radius: 50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("ID : "),
                      Text(dataApiGet.id == null
                          ? "Data id kosong"
                          : "${dataApiGet.id}"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Full Name : "),
                      Text(dataApiGet.name == null
                          ? "Data Nama kosong"
                          : "${dataApiGet.name}"),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Email : "),
                      Text(dataApiGet.email == null
                          ? "Data Email kosong"
                          : "${dataApiGet.email}"),
                      SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          HttpGetStateful.connectApi(
                                  (1 + Random().nextInt(10)).toString())
                              .then((value) {
                            setState(() {
                              dataApiGet = value;
                            });
                            print(dataApiGet.imageURL);
                          });
                        },
                        child: Text("Get data Random"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
