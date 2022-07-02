import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodelfirebase.dart';
import 'package:modern_flutter_ui/ui/firebasehomedetail.dart';
import 'package:provider/provider.dart';

import '../widget/profileimage.dart';

class FirebaseFutureBuilder extends StatefulWidget {
  const FirebaseFutureBuilder({Key? key}) : super(key: key);

  static const nameRoute = '/firebasefuturebuilder';

  @override
  State<FirebaseFutureBuilder> createState() => _FirebaseFutureBuilderState();
}

class _FirebaseFutureBuilderState extends State<FirebaseFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _appBar = AppBar(
      title: Text("Firebase Future Builder"),
    );
    final _bodyHeight = _height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    var dataApi = Provider.of<ProviderFirebase>(context, listen: false);
    return Scaffold(
      appBar: _appBar,
      body: Container(
        height: _bodyHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //NOTE:FutureBuilder
              FutureBuilder(
                future: Provider.of<ProviderFirebase>(context, listen: false)
                    .getApiFutureBuilder(),
                //initialData: InitialData,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  //builder: (context, snapshot) {

                  //print(snapshot.data);

                  if (snapshot.error != null) {
                    return Container(
                      height: _bodyHeight,
                      alignment: Alignment.center,
                      child: Center(
                        child: Text("Eror: ${snapshot.error }"),
                      ),
                    );
                  }
                  //if (snapshot.data == null) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //TIPS:trick untuk membuat widget tetap ditengah walau didalam listview atau singlechildscrollview
                    return Container(
                      height: _bodyHeight,
                      alignment: Alignment.center,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    //print("a");
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        //print("b");
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              FirebaseDetail.nameRoute,
                              arguments: snapshot.data?[index]["id"],
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
                                imageURL: snapshot.data?[index]["imageURL"],
                              ),
                            ),
                          ),
                          title: Text(
                            snapshot.data?[index]["name"],
                          ),
                          subtitle: Text(snapshot.data?[index]["job"]),
                          trailing: IconButton(
                              onPressed: () {
                                dataApi.deleteApi(snapshot.data?[index]["id"]);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete)),

                          //minimal jarak leading
                          //minLeadingWidth: 30,

                          //untuk memperkecil jarak antara leading dan title
                          horizontalTitleGap: 16,
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
      ),
    );
  }
}
