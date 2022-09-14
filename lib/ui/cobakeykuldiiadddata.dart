import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modern_flutter_ui/Providers/cobakeykuldiprovider.dart';
import 'package:modern_flutter_ui/models/cobakeykuldiimodel.dart';
import 'package:provider/provider.dart';
//!Done Pages G.Doc

class CobaKeyKuldiiAddData extends StatefulWidget {
  CobaKeyKuldiiAddData({Key? key}) : super(key: key);

  static const nameRoute = '/cobakeykuldiiadddata';

  @override
  State<CobaKeyKuldiiAddData> createState() => _CobaKeyKuldiiAddDataState();
}

class _CobaKeyKuldiiAddDataState extends State<CobaKeyKuldiiAddData> {
  TextEditingController titleController = TextEditingController();

  TextEditingController subtitleController = TextEditingController();

  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    final cobaKeyProvider =
        Provider.of<CobaKeyKuldiiProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: GestureDetector(
        onTap: () {
          //print("HALO");
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            //shrinkWrap: true,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text("Test"),
                TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: titleController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    //TIPS:labelText inputnya langsung String
                    //labelText: "title",

                    label: Text("title"),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    /*border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(40),
                      ),*/
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: subtitleController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    //TIPS:labelText inputnya langsung String
                    //labelText: "title",

                    label: Text("subtitle"),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    /*border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(40),
                      ),*/
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                //Text("Test"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (_date == null)
                          ? "No Date Choosen"
                          : DateFormat.yMMMEd().format(_date!),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        //TIPS: padding atas bawah kosong on ElevatedButton
                        //minimumSize: Size.zero,

                        //TIPS: padding kiri kanan kosong on ElevatedButton
                        //padding: EdgeInsets.all(0),

                        primary: Colors.blue,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2025),
                        ).then((value) {
                          setState(() {
                            _date = value;
                          });
                        });
                      },
                      child: Text("Pilih Tanggal"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //TIPS: padding atas bawah kosong on ElevatedButton
                    //minimumSize: Size.zero,

                    //TIPS: padding kiri kanan kosong on ElevatedButton
                    //padding: EdgeInsets.all(0),

                    primary: Colors.green,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if ((titleController.text != "") &&
                        (subtitleController.text != "") &&
                        (_date != null)) {
                      //cobaKeyProvider.addData(title, subtitle, Date)
                      cobaKeyProvider.addData(
                        title: titleController.text,
                        subtitle: subtitleController.text,
                        date: _date,
                      );
                      Navigator.pop(context);
                      //print(cobaKeyProvider.data);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 1500),
                          content: Text(
                            "Pastikan semua data telah diisi",
                            //TIPS: untuk menjadikan text scaffold message di tengah, jangan gunakan widget center karena scaffold messenger akan menutupi seluruh layar, tapi gunakanlah textalign:
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    ;
                  },
                  child: Text("Confirm"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
