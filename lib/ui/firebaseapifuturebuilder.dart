import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodelfirebase.dart';
import 'package:modern_flutter_ui/ui/firebasehomedetail.dart';
import 'package:provider/provider.dart';

import '../widget/profileimage.dart';

class FirebaseFutureBuilder extends StatelessWidget {
  const FirebaseFutureBuilder({Key? key}) : super(key: key);

  static const nameRoute = '/firebasefuturebuilder';

  @override
  Widget build(BuildContext context) {
    var dataApi = Provider.of<ProviderFirebase>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Future Builder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: Provider.of<ProviderFirebase>(context, listen: false)
                  .getApiFutureBuilder(),
              //initialData: InitialData,
              //builder: (BuildContext context, AsyncSnapshot snapshot) {
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Consumer<ProviderFirebase>(
                    builder: (context, dataApi, child) {
                      print("a");
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        shrinkWrap: true,
                        itemCount: dataApi.getJumlah,
                        itemBuilder: (BuildContext context, int index) {
                          print("b");
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                FirebaseDetail.nameRoute,
                                arguments: dataApi.data[index]["id"],
                              );
                            },
                            /*leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                dataApi.data[index]["imageURL"],
                              ),
                            ),*/
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 50,
                                height: 50,
                                child: ProfileImage(
                                  imageURL: dataApi.data[index]["imageURL"],
                                ),
                              ),
                            ),
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
                  );
                }

                // ListView.separated(
                //   shrinkWrap: true,
                //   itemCount: 2,
                //   separatorBuilder: (BuildContext context, int index) {
                //     return Divider();
                //   },
                //   itemBuilder: (BuildContext context, int index) {
                //     return Text("List");
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
