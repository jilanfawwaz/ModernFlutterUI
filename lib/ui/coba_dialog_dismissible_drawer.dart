//import 'dart:js';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
//! Done Screen G.Doc

class CobaDiDiDe extends StatefulWidget {
  const CobaDiDiDe({Key? key}) : super(key: key);

  @override
  State<CobaDiDiDe> createState() => _CobaDiDiDeState();
}

class _CobaDiDiDeState extends State<CobaDiDiDe> {
  final List<Widget> _myList = List.generate(5, (index) {
    //! Faker DONE G.DOC
    final String _name = Faker().person.name();
    final String _address = faker.address.streetName();

    return Column(
      children: [
        //! ListTile DONE G.DOC
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people),
            ],
          ),
          onTap: () {
            print("Name: ${_name}, Adress: ${_address}");
            //Navigator.pop(context);
          },
          title: Text(_name),
          subtitle: Text(_address),
          horizontalTitleGap: 1,
        ),
        Divider(),
      ],
    );
  });
  @override
  Widget build(BuildContext context) {
    var faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Dismissible Drawer"),
      ),
      //! Drawer DONE G.DOC
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 214, 213, 213),
        child: Column(
          //padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 200,
              child: UserAccountsDrawerHeader(
                //NOTE: CircleAvatar
                //untuk image lingkaran bisa make circleAvatar atau clipOval, clipOval hanya memotong gambar menjadi lingkaran secara sederhana, sedangkan circleAvatar lebih lengkap (contohnya bisa tambah backgroundcolor secara default untuk gambar png)
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/1-logoPedang.png"),
                  backgroundColor: Colors.green,
                  child: Text(
                    "HALOO",
                    //style: TextStyle(color: Colors.black),
                  ),
                  foregroundColor: Colors.black, //untuk warna text pada child
                  //radius: 10, //di drawer tidak berfungsi, default 20.
                  //foregroundImage: AssetImage("assets/images/7-gambarMojito.png"),
                ),
                //END CircleAvatar

                //NOTE: ClipOval
                /*currentAccountPicture: ClipOval(
                  child: Image.asset(
                    "assets/images/7-gambarMojito.png",
                    fit: BoxFit.cover,
                  ),
                ),
                */
                //END ClipOval

                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                ),
                //accountName: Text("Jilan Fawwaz"),
                //accountEmail: Text("jilan@gmail.com"),
                accountName: Text(faker.person.name()),
                accountEmail: Text(faker.internet.email()),
              ),
            ),

            //NOTE: DrawerHeader
            /*DrawerHeader(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),*/
            //ENDNOTE DrawerHeader

            /*Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: _myList,
              ),
            ),*/

            
            //! Expanded DONE G.DOC
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _myList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return _myList[index];
                },
              ),
            ),
            //END ListView.separated

            //Divider(),
          ],
        ),
      ),
      body: _myList.length != 0
          ? ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: _myList.length,
              separatorBuilder: (BuildContext context, int index) {
                //return Divider();
                return SizedBox();
              },
              itemBuilder: (BuildContext context, int index) {
                //NOTE: sebelumnya ada Builder() membungkus dismissible, tapi kayanya ga berguna
                //return Builder(builder: (context) {

                //NOTE:Dismissible (- item list tile bisa didrag ke kiri dan kanan untuk menghapus atau fungsi lainnya)
                //! Dismissible DONE G.DOC
                return Dismissible(
                  //NOTE:Key
                  key: UniqueKey(),
                  //key: Key(_myList[index].toString()),
                  // key: ValueKey(index.toString()),
                  onDismissed: (directionssss) {
                    //kalau dismiss tidak dikonfirmasi (confirmDissmiss), maka onDismissed tidak akan dijalankan
                    //print(_myList);
                    setState(() {
                      _myList.remove(_myList[index]);
                    });
                    if (directionssss == DismissDirection.endToStart) {
                      print("End To Starts");
                    } else {
                      print("Start To End");
                    }
                  },
                  confirmDismiss: (directionsss) {
                    //! Dialog DONE G.DOC
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete Person"),
                            content:
                                Text("Are You Sure to delete the person???"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  print("Confirm Delete");
                                  //return true; //akan didelete
                                  Navigator.pop(context, true);
                                },
                                child: Text("YES"),
                              ),
                              TextButton(
                                onPressed: () {
                                  print("Cancel Delete");
                                  //return false;
                                  Navigator.pop(context, false);
                                },
                                child: Text("NO"),
                              ),
                            ],
                          );
                        });
                  },

                  background: Container(
                    //kanan ke kiri
                    color: Colors.green[300],
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    //kiri ke kanan
                    color: Colors.red[300],
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  //direction: DismissDirection.endToStart,
                  child: _myList[index],
                );
              },
            )
          : Center(
              child: Text("You Have No List"),
            ),
    );
  }
}
