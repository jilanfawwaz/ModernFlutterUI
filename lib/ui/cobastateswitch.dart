import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobahalamankosong.dart';
import 'package:modern_flutter_ui/ui/cobastateswitchwidgetcounter.dart';

class CobaState extends StatefulWidget {
  const CobaState({Key? key}) : super(key: key);

  static String nameRoute = '/cobastate';

  @override
  State<CobaState> createState() => _CobaStateState();
}

class _CobaStateState extends State<CobaState> with WidgetsBindingObserver {
  int numberButton = 0;
  bool _switchStatus = false;
  bool _switchStatus2 = false;

  AppLifecycleState? _stateNow;

  // Kalo ditaroh disini, context gabisa kebaca
  // if ((ModalRoute.of(context)?.settings.arguments) != null) {
  //     numberButton = ModalRoute.of(context)?.settings.arguments as int;
  //   }

  //NOTE:Widget LifeCycle
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

    //numberButton = (ModalRoute.of(context)?.settings.arguments as int);
  }

  //baru bisa dipake setelah memasukkan WidgetsBinding.instance?.addObserver(this); di initState
  //NOTE:AppLifeCycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      print("Aplikasi ngambang");
    } else if (state == AppLifecycleState.paused) {
      print("Aplikasi keluar");
      setState(() {
        _stateNow = state;
      });
    } else if (state == AppLifecycleState.resumed) {
      print("Masuk Kembali ke apliaksi");
    }

    //print(state);
  }

  @override
  void didChangeDependencies() {
    if ((ModalRoute.of(context)?.settings.arguments) != null) {
      numberButton = ModalRoute.of(context)?.settings.arguments as int;
    }

    super.didChangeDependencies();
  }

  //didUpdateWidget() ada di file dart widget counter (cobastateswtichwidgetcounter.dart)

  @override
  void deactivate() {
    print("deactive");

    super.deactivate();
  }

  @override
  void dispose() {
    // supaya tidak terjadi memory leaks karena sebelumnya telah memanggil addObserver
    WidgetsBinding.instance?.removeObserver(this);
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //kalo ditaroh disini, numberButton akan terus membuild nilai dari modalRoute, dan nilai tidak akan berubah2
    // if ((ModalRoute.of(context)?.settings.arguments) != null) {
    //   numberButton = ModalRoute.of(context)?.settings.arguments as int;
    // }
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _appBar = AppBar(
      title: Text("COBA STATE"),
    );
    final _bodyHeight = _height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CobaStateWidgetCounter(numberButton: numberButton),
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
                    Navigator.pushNamed(
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
          _stateNow == AppLifecycleState.paused
              ? Container(
                  height: _bodyHeight,
                  width: _width,
                  color: Colors.grey.withOpacity(0.9),
                )
              : SizedBox(),
          _stateNow == AppLifecycleState.paused
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Anda Sempat Keluar Dari Aplikasi,\nlanjutkan penghitungan?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _stateNow = AppLifecycleState.resumed;
                          });
                        },
                        child: Text("Resume"),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
