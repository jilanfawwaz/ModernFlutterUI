import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/providermodelfirebase.dart';
import 'package:provider/provider.dart';

class FirebaseDetail extends StatelessWidget {
  FirebaseDetail({Key? key}) : super(key: key);

  static String nameRoute = '/firebasedetail';
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context)?.settings.arguments as String;
    final dataApi = Provider.of<ProviderFirebase>(context, listen: false);

    nameController =
        TextEditingController(text: dataApi.getProductById(productId)["name"]);
    jobController =
        TextEditingController(text: dataApi.getProductById(productId)["job"]);
    imageController = TextEditingController(
        text: dataApi.getProductById(productId)["imageURL"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Edit API"),
      ),
      body: Container(
        //height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      dataApi.getProductById(productId)["imageURL"]),
                  radius: 70,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Name : ",
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    enableSuggestions: false,
                    controller: nameController,
                    //initialValue: dataApi["name"].toString(),
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Job : ",
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Image URL : ",
                  textAlign: TextAlign.start,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    dataApi
                        .patchApi(
                      id: dataApi.getProductById(productId)["id"],
                      name: nameController.text,
                      job: jobController.text,
                      imageURL: imageController.text,
                    )
                        .then(
                      (_) {
                        nameController.clear();
                        jobController.clear();
                        imageController.clear();
                        Navigator.pop(context);

                        //Navigator.pushNamedAndRemoveUntil(context, '/firebaseapihome', (route) => false,);
                      },
                    );
                    //nameController.text("halo");
                    //

                    //Navigator.pop(context);
                    //print(nameController.text);
                  },
                  child: const Text("Edit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
