import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_flutter_ui/Providers/cobascheckboxprovider.dart';
import 'package:provider/provider.dart';

import '../widget/CobaCheckboxWidgetAdd.dart';

class CobaCheckbox extends StatelessWidget {
  CobaCheckbox({Key? key}) : super(key: key);

  var checkboxStatus = false;

  @override
  Widget build(BuildContext context) {
    var dataCheckbox =
        Provider.of<CobaCheckboxProvider>(context, listen: false);

    print(dataCheckbox.data.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Checkbox"),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(9.0),
            child: dataCheckbox.data.length == []
                ? Center(
                    child: Text("Data Kosong"),
                  )
                : ListView(
                    children: [
                      Card(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Checkbox(
                                value: checkboxStatus,
                                onChanged: (value) {
                                  // setState(() {
                                  //   checkboxStatus = value!;
                                  // });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Halo"),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),

          CobaCheckboxWidgetAdd(),

          //TIPS:Salah satu cara menaruh container kebawah, container dibungkus dengan column, lalu gunakan mainaxisalignment.end
        ],
      ),
    );
  }
}
