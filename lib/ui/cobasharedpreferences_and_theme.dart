import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/Providers/cobasharedpreferences_and_themeprovider.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CobaSharedAndTheme extends StatefulWidget {
  const CobaSharedAndTheme({Key? key}) : super(key: key);

  @override
  State<CobaSharedAndTheme> createState() => _CobaSharedAndThemeState();
}

class _CobaSharedAndThemeState extends State<CobaSharedAndTheme> {
  var number = 0;

  //var shared = SharedPreferences.getInstance();

  saveNumber(int number) async {
    var shared = await SharedPreferences.getInstance();
    shared.setInt('numberNow', number);
  }

  CobaSharedAndThemeProvider dataNumber = CobaSharedAndThemeProvider();

  @override
  void dispose() {
    // TODO: implement dispose
    dataNumber.removeListener(dataNumberListener);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataNumber.addListener(dataNumberListener);
  }

  dataNumberListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dataNumber = Provider.of<CobaSharedAndThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Shared'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //number.toString(),
              dataNumber.number.toString(),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    dataNumber.decreaseNumber();
                  },
                  child: Icon(Icons.remove),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue, width: 3),
                    shape: StadiumBorder(),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      dataNumber.addNumber();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                    style: TextButton.styleFrom(
                      //backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Colors.blue, width: 3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
