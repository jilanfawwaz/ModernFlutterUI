import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/cobascheckboxprovider.dart';
import 'package:provider/provider.dart';

class CobaCheckboxWidgetCard extends StatelessWidget {
  final String title;
  final String id;
  bool isSelected;
  bool isChanged = false;

  CobaCheckboxWidgetCard({
    Key? key,
    required this.title,
    required this.id,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataCheckbox =
        Provider.of<CobaCheckboxProvider>(context, listen: false);
    //print("masuk");
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                dataCheckbox.changeBoxStatus(id, !isSelected);
                
                if (value == false) {
                  dataCheckbox.changeCheckboxStatusAllDeselect();
                }
                dataCheckbox.checkSelectedAll();
              },
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text(title)),
            Spacer(),
            IconButton(
              onPressed: () {
                dataCheckbox.removeData(id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
