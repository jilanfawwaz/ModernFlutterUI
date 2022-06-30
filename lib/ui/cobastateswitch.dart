import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobahalamankosong.dart';

class CobaState extends StatefulWidget {
  const CobaState({Key? key}) : super(key: key);

  static String nameRoute = '/cobastate';

  @override
  State<CobaState> createState() => _CobaStateState();
}

class _CobaStateState extends State<CobaState> {
  int numberButton = 0;
  bool _switchStatus = false;
  bool _switchStatus2 = false;
  @override
  /*void initState() {
    // TODO: implement initState

    super.initState();
  }*/

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   numberButton = (ModalRoute.of(context)?.settings.arguments as int);
  // }

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if ((ModalRoute.of(context)?.settings.arguments as int) != null) {
      numberButton = ModalRoute.of(context)?.settings.arguments as int;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COBA STATE"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                numberButton.toString(),
                style: TextStyle(
                  //NOTE:double.parse (mengubah int menjadi double)
                  fontSize: 30 + double.parse(numberButton.toString()),
                ),
              ),
              Switch.adaptive(
                activeColor: Colors
                    .amber, //untuk switch ios, cuma bisa dicustom untuk activeColor dan inactiveTrackColor
                inactiveTrackColor: Colors.red,
                value: _switchStatus,
                onChanged: (value) {
                  setState(() {
                    _switchStatus = !_switchStatus;
                  });
                  print(_switchStatus);
                },
              ),
              //NOTE:Switch
              Switch.adaptive(
                activeColor: Colors
                    .amber, //untuk switch ios, cuma bisa dicustom untuk activeColor dan inactiveTrackColor
                inactiveTrackColor: Colors.red,
                value: _switchStatus2, //false or true
                onChanged: (value) {
                  setState(() {
                    _switchStatus2 = !_switchStatus2;
                  });
                  print(_switchStatus2);
                },
              ),
              Text(
                _switchStatus ? "Switch On" : "Switch Off",
              ),
              Text(
                _switchStatus2 ? "Switch 2 On" : "Switch 2 Off",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        if (numberButton == 0) {
                          null;
                        } else {
                          numberButton--;
                        }
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        numberButton++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        //primary: Colors.purple[900],
                        ),
                    child: Icon(
                      Icons.add,
                      //color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    //Navigator.pushNamed(
                    context,
                    CobaHalamanKosong.nameRoute,
                    arguments: numberButton,
                  );
                },
                child: Text("Pindah Halaman"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
