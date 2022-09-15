import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//!Done Screen G.Doc

class CobaTabBar extends StatelessWidget {
  //List<Widget> _myTab = [
  final List<Tab> _myTab = [
    Tab(
      text: "Tab 1",
      icon: Icon(Icons.access_time),
    ),
    Tab(
      text: "Tab 2",
    ),
    Tab(
      //kalo make child, maka text harus nonaktif, begitu pula sebaliknya
      //text: "Tab 3",
      icon: Icon(Icons.access_time),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.blue,
      ),
    ),
  ];
  CobaTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //versi pertama defaultTabController langsung membungkus tabBar, wajib make preferred size
    /*return Scaffold(
      appBar: AppBar(
        title: Text("Coba App Bar"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              tabs: [
                Tab(text: "Tab 1"),
                Tab(text: "Tab 2"),
                Tab(text: "Tab 3"),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(child: Text("data")),
        ],
      ),
    );*/

    //versi 2 DefaultTabController membungkus scaffold, gaperlu make preferredsize karena sudah default
    return DefaultTabController(
      length: _myTab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Coba App Bar"),
          bottom: TabBar(
            indicatorColor: Colors.black, //warna garis untuk selected tab
            indicatorWeight: 5, //ketebalan garis selected tab
            //indicatorPadding: EdgeInsets.fromLTRB(30, 100, 20, 0),
            //indicatorPadding: EdgeInsets.only(bottom: 10, left: 10),
            //kalo make indicator:boxDecoration, maka indicatorColor, weigh akan diabaikan. yang bisa hanya padding
            indicator: BoxDecoration(
              color: Colors.amber,
              //borderRadius: BorderRadius.circular(20),
              //kalo make border, maka borderradius harus mati
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 5,
                ),
              ),
            ),

            labelColor: Colors.green, //warna isi tab yang terseleksi
            unselectedLabelColor:
                Colors.white, //warna isi tab yang tidak terseleksi

            tabs: _myTab,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    "data Tab 1",
                    style:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Text("data Tab 2"),
                ),
              ],
            ),
            Center(
              child: Text("data Tab 3"),
            ),
          ],
        ),
      ),
    );
  }
}
