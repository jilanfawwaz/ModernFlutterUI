import 'package:flutter/material.dart';

class CobaState extends StatefulWidget {
  const CobaState({Key? key}) : super(key: key);

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
              Switch.adaptive(
                activeColor: Colors
                    .amber, //untuk switch ios, cuma bisa dicustom untuk activeColor dan inactiveTrackColor
                inactiveTrackColor: Colors.red,
                value: _switchStatus2,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
