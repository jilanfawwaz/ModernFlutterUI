import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_flutter_ui/Providers/cobascheckboxprovider.dart';
import 'package:provider/provider.dart';

import '../widget/cobacheckboxwidgetadd.dart';
import '../widget/cobacheckboxwidgetcard.dart';

class CobaCheckbox extends StatelessWidget {
  CobaCheckbox({Key? key}) : super(key: key);

  var checkboxStatus = false;

  @override
  Widget build(BuildContext context) {
    var dataCheckbox =
        Provider.of<CobaCheckboxProvider>(context, listen: false);

    //print(dataCheckbox.data.length);
    print("masuk checkbox");
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

          Consumer<CobaCheckboxProvider>(
              builder: (context, dataCheckbox, child) {
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: dataCheckbox.data.length == 0
                  ? Center(
                      child: Text("Data Kosong"),
                    )
                  : Column(
                      children: [
                        dataCheckbox.data.length == 1
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: dataCheckbox.selectAll,
                                      onChanged: (value) {
                                        dataCheckbox.changeCheckboxStatusAll();
                                      },
                                    ),
                                    Text("Select All"),
                                  ],
                                ),
                              ),
                        Expanded(
                          child: ListView(
                            children: [
                              for (final item in dataCheckbox.data)
                                CobaCheckboxWidgetCard(
                                  title: item.title,
                                  id: item.id,
                                  isSelected: item.isSelected,
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 150),
                      ],
                    ),
            );
          }),

          CobaCheckboxWidgetAdd(),

          //TIPS:Salah satu cara menaruh container kebawah, container dibungkus dengan column, lalu gunakan mainaxisalignment.end
        ],
      ),
    );
  }
}
