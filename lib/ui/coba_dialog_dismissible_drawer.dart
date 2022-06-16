import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class CobaDiDiDe extends StatelessWidget {
  const CobaDiDiDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    final List<Widget> _myList = List.generate(20, (index) {
      final String _name = faker.company.name();
      final String _address = faker.address.streetName();
      return Column(
        children: [
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people),
              ],
            ),
            onTap: () {
              print("Name: ${_name}, Adress: ${_address}");
              Navigator.pop(context);
            },
            title: Text(_name),
            subtitle: Text(_address),
            horizontalTitleGap: 1,
          ),
          //Divider(),
        ],
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Dismissible Drawer"),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 214, 213, 213),
        child: Column(
          //padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 200,
              child: UserAccountsDrawerHeader(
                //NOTE: CircleAvater
                //untuk image lingkaran bisa make circleAvatar atau clipOval, clipOval hanya memotong gambar menjadi lingkaran secara sederhana, sedangkan circleAvatar lebih lengkap (contohnya bisa tambah backgroundcolor secara default untuk gambar png)
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/1-logoPedang.png"),
                  backgroundColor: Colors.green,
                  child: Text(
                    "HALOO",
                    //style: TextStyle(color: Colors.black),
                  ),
                  foregroundColor: Colors.black, //untuk warna child pada text
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

            //NOTE: ListView.separated
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
      body: Column(
        children: [],
      ),
    );
  }
}
