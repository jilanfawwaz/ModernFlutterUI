import 'package:flutter/material.dart';
//! Done Widget G.Doc

class Badge extends StatelessWidget {
  Widget child;
  String value;

  Badge({required this.child, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        child,
        //NOTE:Positioned
        Positioned(
          //posisi di atas mulai dari kanan atas, kasih padding 5 dari atas, kasih padding 5 dari kanan
          top: 4,
          right: 4,
          child: Container(
            padding: EdgeInsets.all(2),
            constraints: BoxConstraints(
              //buat kasih minimal atau maksimal dari lebar/tinggi
              minHeight: 16,
              minWidth: 16,
              // maxHeight: 16,
              // maxWidth: 16,
            ),
            // width: 16,
            // height: 16,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
