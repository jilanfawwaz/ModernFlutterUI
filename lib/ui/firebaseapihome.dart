import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodelfirebase.dart';
import 'package:provider/provider.dart';

class FirebaseHome extends StatefulWidget {
  FirebaseHome({Key? key}) : super(key: key);

  @override
  State<FirebaseHome> createState() => _FirebaseHomeState();
}

class _FirebaseHomeState extends State<FirebaseHome> {
  TextEditingController nameController = TextEditingController();

  TextEditingController jobController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    context.read<ProviderFirebase>().getApi();
    //print(context.read<ProviderFirebase>().getJumlah);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataApi = Provider.of<ProviderFirebase>(context, listen: false);
    //ProviderFirebase data = ProviderFirebase();

    Widget tambahAkun() {
      //print("Masuk");
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create User"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name : ",
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                controller: nameController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  //   borderSide: BorderSide(color: Colors.green),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Text(
              "Job : ",
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                controller: jobController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  //   borderSide: BorderSide(color: Colors.green),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Text(
              "Url Image : ",
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextFormField(
                //di keyboard simulator ios/android, ketika menekan done maka langsung ke eksekusi //belajar
                textInputAction: TextInputAction.done,

                autocorrect: false,
                enableSuggestions: false,
                controller: imageController,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  //   borderSide: BorderSide(color: Colors.green),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  dataApi
                      .connectApi(
                        name: nameController.text,
                        job: jobController.text,
                        imageURL: imageController.text,
                        createdAt: DateTime.now(),
                      )
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Data Telah Ditambahkan",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );

                  nameController.clear();
                  jobController.clear();
                  imageController.clear();

                  Navigator.pop(context);
                  //print(dataApi.getJumlah);
                },
                child: const Text("Haloo"),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase API"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                //barrierColor untuk latar belakang ketika dialog dibuka (default abu2 transparant)
                barrierColor: Colors.amber.withOpacity(0.2),
                //barrierDismissible latar belakang gabisa dipencet untuk ngepop/dipencet
                //barrierDismissible: false,

                context: context,
                builder: (context) {
                  /*return Dialog(
                    backgroundColor: Colors.transparent,
                    //insetPadding: EdgeInsets.symmetric(horizontal: 20),
                    //insetPadding: EdgeInsets.all(10),
                    insetPadding: EdgeInsets.zero,

                    child: Stack(
                      //kalau ada children stack yang keluar (overflow, biasanya make positioned()), maka akan tetap ditampilkan
                      //clipBehavior: Clip.none,

                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          height: 10,
                          //color: Colors.green,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                        ),
                        Positioned(
                          top: 0,
                          child: Image.network(
                            "https://i.imgur.com/2yaf2wb.png",
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  );*/

                  return GestureDetector(
                    onTap: () {
                      //yang ini versi lama
                      //FocusScope.of(context).requestFocus(FocusNode());

                      //yang ini versi baru, unfocus() adalah method baru dari focusscope

                      FocusScope.of(context).unfocus();
                    },
                    child: Dialog(
                      //elevation dialog untuk mengilangkan shadow
                      elevation: 0,
                      backgroundColor: Colors.transparent,

                      //insetPadding: EdgeInsets.symmetric(horizontal: 20),
                      //insetPadding: EdgeInsets.all(10),

                      insetPadding: EdgeInsets.zero,

                      child: Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          var height = MediaQuery.of(context).size.height;
                          var width = MediaQuery.of(context).size.width;

                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: height * 0.6,
                            width: width * 0.8,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: tambahAkun(),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
              //print("masuks");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //NOTE: Transform() matrix.translation
            /*ListTile(
              leading: Icon(Icons.favorite),
              title: Transform(
                transform: Matrix4.translationValues(-16, 0.0, 0.0),
                child: Text(
                  "Title text",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),*/
            Consumer<ProviderFirebase>(
              builder: (context, dataApi, child) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  shrinkWrap: true,
                  itemCount: dataApi.getJumlah,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(dataApi.data[index]["imageURL"])),
                      title: Text(
                        dataApi.data[index]["name"],
                      ),
                      subtitle: Text(dataApi.data[index]["job"]),
                      trailing: IconButton(
                          onPressed: () {
                            dataApi.deleteApi(dataApi.data[index]["id"]);
                          },
                          icon: Icon(Icons.delete)),

                      //minimal jarak leading
                      //minLeadingWidth: 30,

                      //untuk memperkecil jarak antara leading dan title
                      horizontalTitleGap: 16,
                    );
                  },
                );
              },
            ),
            //tambahAkun(),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  //barrierColor untuk latar belakang ketika dialog dibuka (default abu2 transparant)
                  barrierColor: Colors.amber.withOpacity(0.2),
                  //barrierDismissible latar belakang gabisa dipencet untuk ngepop
                  //barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    /*return Dialog(
                    backgroundColor: Colors.transparent,
                    //insetPadding: EdgeInsets.symmetric(horizontal: 20),
                    //insetPadding: EdgeInsets.all(10),
                    insetPadding: EdgeInsets.zero,

                    child: Stack(
                      //kalau ada children stack yang keluar (overflow, biasanya make positioned()), maka akan tetap ditampilkan
                      //clipBehavior: Clip.none,

                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          height: 10,
                          //color: Colors.green,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                        ),
                        Positioned(
                          top: 0,
                          child: Image.network(
                            "https://i.imgur.com/2yaf2wb.png",
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  );*/

                    return GestureDetector(
                      onTap: () {
                        //yang ini versi lama
                        //FocusScope.of(context).requestFocus(FocusNode());

                        //yang ini versi baru, unfocus() adalah method baru dari focusscope

                        FocusScope.of(context).unfocus();
                      },
                      child: Dialog(
                        //elevation dialog untuk mengilangkan shadow
                        elevation: 0,
                        backgroundColor: Colors.transparent,

                        //insetPadding: EdgeInsets.symmetric(horizontal: 20),
                        //insetPadding: EdgeInsets.all(10),

                        insetPadding: EdgeInsets.zero,

                        child: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height;
                            var width = MediaQuery.of(context).size.width;

                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: height * 0.6,
                              width: width * 0.8,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: tambahAkun(),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("Add data"),
            ),
          ],
        ),
      ),
    );
  }
}
