import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobadropdownjilanmodel.dart';
import 'package:provider/provider.dart';

import '../Providers/cobascheckboxprovider.dart';

class CobaDropdownJilanAdd extends StatefulWidget {
  CobaDropdownJilanAdd({Key? key}) : super(key: key);

  @override
  State<CobaDropdownJilanAdd> createState() => _CobaDropdownJilanAddState();
}

class _CobaDropdownJilanAddState extends State<CobaDropdownJilanAdd> {
  final _maxLength = 10;

  var _textLength = 0;

  var titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dataDropdown =
        Provider.of<CobaDropdownJilanModel>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          //height: 150,
          margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.green.shade300,
          ),
          child: Column(
            children: [
              Text("Add Data Dropdown"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      //TIPS:membatasi jumlah karaketer di form

                      //make ini gaada status jumlah dibawah form
                      /*inputFormatters: [
                              LengthLimitingTextInputFormatter(42),
                            ],*/

                      //yang ini ada status jumlah, tapi bisa disembunyikan di decoration: inputDecoration()
                      maxLength: _maxLength,

                      //setelah mencapai batas max, apakah masih bisa ngetik? kalo none berarti masih bisa, default enforcesd
                      //maxLengthEnforcement: MaxLengthEnforcement.none,

                      autocorrect: false,
                      enableSuggestions: false,
                      cursorColor: Colors.black,
                      controller: titleController,

                      onChanged: (value) {
                        //print(value);
                        setState(() {
                          _textLength = value.length;
                        });
                      },

                      decoration: InputDecoration(
                        suffix: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "$_textLength/$_maxLength",
                            style: TextStyle(
                                fontSize: 10,
                                color: _textLength < 10
                                    ? Colors.grey
                                    : Colors.red),
                          ),
                        ),

                        //counter untuk menampilkan atau menyembunyikan tampilan maxlength
                        counterText: "",
                        // counter: Text("aa"),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),

                  //TIPS: kalau splash di iconButton gakelihatan (karena ketumpuk sama stack/row), bisa di wrap menggunakan widget material
                  Material(
                    //borderRadius: BorderRadius.circular(40),
                    color: Colors.transparent,

                    //supaya splash berbentuk lingkaran, kedua argumen ini harus disetting
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,

                    child: SizedBox(
                      //mengurangi lebar iconbutton bisa juga dibungkus dengan container
                      //margin: EdgeInsets.only(left: 10),
                      //padding: const EdgeInsets.all(0.0),
                      width: 22.0,
                      child: IconButton(
                        splashColor: Colors.grey.withOpacity(0.5),
                        onPressed: () {
                          if (titleController.text != "") {
                            dataDropdown.addDropdown(
                              title: titleController.text,
                            );
                            dataDropdown.createDropdown();
                            titleController.clear();
                            setState(() {
                              _textLength = 0;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(milliseconds: 500),
                                content: Text(
                                  "Gagal, pastikan data tidak kosong",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        padding: EdgeInsets.zero,

                        //VisualDensity untuk mengurangi lebar padding bawaan dari iconbutton
                        // visualDensity: VisualDensity(
                        //   horizontal: -4.0,
                        //   //vertical: -4.0,
                        // ),

                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),

                  //NOTE:Material Button
                  /*SizedBox(
                          width: 20,
                          child: MaterialButton(
                            color: Colors.blue,
                            shape: const CircleBorder(),
                            height: 10,
                            onPressed: () {},
                            child: Icon(Icons.add),
                          ),
                        ),*/
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
