import 'package:flutter/material.dart';
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
                  Center(
                    child: Column(
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
