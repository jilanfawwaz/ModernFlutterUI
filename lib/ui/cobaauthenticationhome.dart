import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/cobaauthenticationprovider.dart';
import 'package:modern_flutter_ui/widget/cobaauthenticationadd.dart';
import 'package:provider/provider.dart';

class CobaAuthenticationHome extends StatelessWidget {
  const CobaAuthenticationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataAuthentication = Provider.of<CobaAuthenticationProvider>(context);
    TextEditingController titleController = TextEditingController();

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
              "Title : ",
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                controller: titleController,
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
                onPressed: () {},
                child: const Text("Edit"),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication Home"),
      ),
      body: Stack(
        children: [
          Center(
            child: dataAuthentication.dataAuthentication.length != 0
                ? ListView(
                    children: [
                      for (var item in dataAuthentication.dataAuthentication)
                        Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              title: Text(
                                item['title'],
                              ),
                              subtitle: Text(item['subtitle']),
                              trailing: IconButton(
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

                                          //NOTE: Builder() get from this https://stackoverflow.com/questions/53913192/flutter-how-to-change-the-width-of-an-alertdialog
                                          //Builder() berguna agar ukuran size dialog dapat dicustom dengan lebih baik
                                          // ketika mau membuat sebuah variabel atau widget diluar widget build, tapi membutuhkan context, kita masih dapat menggunakan widget builder()

                                          child: Builder(
                                            builder: (context) {
                                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                              var height =
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height;
                                              var width = MediaQuery.of(context)
                                                  .size
                                                  .width;

                                              return Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                height: height * 0.6,
                                                width: width * 0.8,
                                                //color: Colors.white,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
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
                                icon: Icon(Icons.delete),
                              ),
                            ),
                            Divider(),
                          ],
                        )
                    ],
                  )
                : Center(
                    child: Text("Data Kosong"),
                  ),
          ),
          CobaAuthenticationAdd(),
        ],
      ),
    );
  }
}
