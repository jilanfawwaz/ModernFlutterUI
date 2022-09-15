import 'dart:math';

import 'package:flutter/material.dart';
//! Done Screen G.Doc
//! Screen G.Doc

class CobaGridView extends StatelessWidget {
  const CobaGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _myGrid = List.generate(100, (index) {
      return Container(
        //untuk width dan height tidak akan berpengaruh di grid, karena grid menggunakan ratio, bukan fix height
        //width: 100,
        //height: 100,
        color: Color.fromARGB(
          255,
          //NOTE:RANDOM().nextInt() (-angka 256 itu maksudnya akan merender angka random dari 0 sampai 256)
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Coba Grid View"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
              ),
              GridView.count(
                //kalau GridView aja gamake .count, masukkan semua (kecuali children) ke gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, ....),

                //shrinkwrap berfungsi agar panjang grid hanya sesuai sama panjang list, tidak mengambil panjang sepanjang parentnya
                shrinkWrap: true,
                childAspectRatio: 4 / 3,

                //scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                //physics: ClampingScrollPhysics(),
                //physics: BouncingScrollPhysics(),

                padding: EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: _myGrid,
              ),

              //NOTE:GridView tanpa .count
              /*GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(20),
                children: _myGrid,
              ),*/
              //END:GridView tanpa .count

              //NOTE: GridView make .builder
              /*GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(20),
                itemCount: _myGrid.length,
                itemBuilder: (BuildContext context, int index) {
                  return _myGrid[index];
                },
              ),*/
            ],
          ),
        ],
      ),

      //NOTE: yang ini container tetap stay diatas, grid view bisa discroll
      /*body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
          Expanded(
            //or Flexible, or container kalau mau menambahkan fixed height
            child: GridView.count(
              //shrinkwrap berfungsi agar panjang grid hanya sesuai sama panjang list, tidak mengambil panjang sepanjang parentnya
              shrinkWrap: true,
              childAspectRatio: 4 / 3,
              //physics: NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              //physics: BouncingScrollPhysics(),

              //padding: EdgeInsets.all(5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: _myGrid,
            ),
          ),
        ],
      ),*/
    );
  }
}
