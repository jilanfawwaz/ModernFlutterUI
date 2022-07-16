import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/models/cobadropdownjilanmodel.dart';
import 'package:modern_flutter_ui/widget/cobadropdownjilanadd.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CobaDropdownJilan extends StatefulWidget {
  CobaDropdownJilan({Key? key}) : super(key: key);

  @override
  State<CobaDropdownJilan> createState() => _CobaDropdownJilanState();
}

class _CobaDropdownJilanState extends State<CobaDropdownJilan> {
  //TIPS:supaya _fruitData bisa diparse dan dimasukkan ke dropdownMenuItem, maka variabelnya harus static
  static final List<String> _fruitData = ['apel', 'timun', 'semangka', 'kiwi'];

  final List<DropdownMenuItem<String>> _dropdownItems = _fruitData
      .map(
        (e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  final List<DropdownMenuItem<String>> _dropdownItemsHint = _fruitData
      .map(
        (e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  //TIPS:Value untu dropdown harus berisi string yang ada di dalam data drowpdown ('_fruitData'), kalau ngga sama bakal error, atau data boleh juga dikosongkan dengan String?
  String? _dropdownValue = 'apel';

  //TIPS:kalau dropdownnya dengan hint, variabel harus kosong dan tidak boleh diisi, kalau diisi bakal error
  String? _dropdownValueHint;

  String? _dropdownValueCustom;

  @override
  Widget build(BuildContext context) {
    var dataDropdown = Provider.of<CobaDropdownJilanModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Dropdown Jilan"),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //NOTE:Dropdown using package
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownSearch<String>(
                    //button buat reset pilihan
                    showClearButton: true,

                    mode: Mode.MENU,

                    //kalau item udah dipilih, di dropdown nanti bakal warna biru
                    showSelectedItems: true,

                    //items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    items: _fruitData,

                    dropdownSearchDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Pilih Buah",
                      hintText: "buah apa yang anda inginkan?",
                    ),
                    popupItemDisabled: (String s) => s.startsWith('k'),
                    onChanged: (value) {
                      print(value);
                    },
                    selectedItem: "apel",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //NOTE:Dropdown (kuno)
                DropdownButton<String>(
                  value: _dropdownValue,
                  //hint: Text('Pilih Buah'),
                  items: this._dropdownItems,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _dropdownValue = value.toString();
                      });
                    }
                    print(_dropdownValue);
                  },
                ),
                Text('Yang terpilih : $_dropdownValue'),
                SizedBox(
                  height: 40,
                ),
                DropdownButton<String>(
                  value: _dropdownValueHint,
                  hint: Text('Pilih Buah'),
                  items: this._dropdownItems,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _dropdownValueHint = value.toString();
                      });
                    }
                    print(_dropdownValue);
                  },
                ),
                Text(
                  _dropdownValueHint == null
                      ? "anda belum memilih"
                      : 'Yang terpilih : $_dropdownValueHint',
                ),
                SizedBox(
                  height: 40,
                ),

                //dropdown custom data diambil dari textformfield
                Consumer<CobaDropdownJilanModel>(
                  builder: (context, dataDropdown, child) {
                    if (dataDropdown.title.length != 0) {
                      return Column(
                        children: [
                          DropdownButton<String>(
                              dropdownColor: Colors.amber,
                              focusColor: Colors.blue,
                              icon: Icon(Icons.add),
                              items: dataDropdown.dropdownItems,
                              value: _dropdownValueCustom,
                              hint: Text("pilih dropdown"),
                              onChanged: (value) {
                                setState(() {
                                  _dropdownValueCustom = value.toString();
                                });
                              }),
                          Text(_dropdownValueCustom != null
                              ? "Yang terpilih : ${_dropdownValueCustom}"
                              : "anda belum memilih"),
                        ],
                      );
                    }
                    return Text("Dropdown Kosong");
                  },
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
          CobaDropdownJilanAdd(),
        ],
      ),
    );
  }
}
