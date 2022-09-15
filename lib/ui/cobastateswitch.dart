import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/ui/cobahalamankosong.dart';
import 'package:modern_flutter_ui/widget/cobastateswitchwidgetcounter.dart';
//! Done Screen G.Docs
//! Done Pages G.Doc

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
  bool _checkBoxStatus = false;

  AppLifecycleState? _stateNow;

  // Kalo ditaroh disini, context gabisa kebaca
  // if ((ModalRoute.of(context)?.settings.arguments) != null) {
  //     numberButton = ModalRoute.of(context)?.settings.arguments as int;
  //   }

  //NOTE:Widget LifeCycle
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);

    //jangan ditaroh disini bakal eror
    /*if ((ModalRoute.of(context)?.settings.arguments) != null) {
      numberButton = ModalRoute.of(context)?.settings.arguments as int;
    }*/
  }

  //TIPS: didChangeAppLifecycleState baru bisa dipake setelah memasukkan WidgetsBinding.instance?.addObserver(this); di initState
  //NOTE:AppLifeCycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      print("Aplikasi ngambang");
    } else if (state == AppLifecycleState.paused) {
      //TIPS:Pause aplikasi saat keluar
      print("Aplikasi keluar");
      setState(() {
        _stateNow = state;
      });
    } else if (state == AppLifecycleState.resumed) {
      print("Masuk Kembali ke aplikasi");
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
    //TIPS:supaya tidak terjadi memory leaks karena sebelumnya telah memanggil addObserver
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade200,
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

                //NOTE:Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    Text(
                      _switchStatus ? "Switch On" : "Switch Off",
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Switch.adaptive(
                      activeColor: Colors
                          .amber, //untuk switch ios, cuma bisa dicustom untuk activeColor dan inactiveTrackColor
                      inactiveTrackColor: Colors.red,
                      value: _switchStatus2, //false or true
                      onChanged: (_) {
                        setState(() {
                          _switchStatus2 = !_switchStatus2;
                        });
                        print(_switchStatus2);
                      },
                    ),
                    Text(
                      _switchStatus2 ? "Switch 2 On" : "Switch 2 Off",
                    ),
                  ],
                ),

                //NOTE:Transform.scale untuk memperbesar sebuah widget
                Align(
                  //NOTE:Alignment(x,y), skala X dan Y adalah dari -1 sampai 1.
                  //x ke kiri kanan, ya ke atas bawah
                  //(0,0) ada ditengah/center
                  //negatif ke kiri, positif ke kanan
                  alignment: Alignment(-0.7, 0),
                  //alignment: Alignment.topLeft,
                  child: Transform.scale(
                    scale: 1.5,

                    //NOTE:Checkbox
                    child: Container(
                      //TIPS: container untuk mengatur lebar dan tinggi dari daerah yang bisa dipencet
                      height:
                          15, //15 adalah ukuran yang paling pas, kalau checkbox diperbesar make scale container ini juga akan diperbesar
                      width: 15,
                      child: Checkbox(
                        //TIPS: materialTapTargetSize untuk mengatur lebar dan tinggi dari daerah yang bisa dipencet
                        //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        shape: CircleBorder(),
                        side: BorderSide(
                          color: Colors.amber,
                          width: 2,
                          //menghilangkan border
                          //style: BorderStyle.none,
                        ),
                        //hanya bisa untuk web atau windows app
                        //hoverColor: Colors.green,
                        activeColor: Colors.amber,
                        checkColor: Colors.blue,
                        value: _checkBoxStatus,
                        //splashRadius: 5,
                        onChanged: (value) {
                          //TIPS:ketika checbox dipencet, kembalian value akan berisi inverse/kebalikan dari avalue saat ini
                          //print(value);
                          setState(() {
                            _checkBoxStatus = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(),
                CheckboxListTile(
                  title: Text("Halo"),
                  subtitle: Text("apa nih"),

                  //checkbox di kiri
                  //controlAffinity: ListTileControlAffinity.leading,

                  //tristate: true,
                  //dense: true,
                  //isThreeLine: true,
                  value: _checkBoxStatus,
                  onChanged: (value) {
                    //TIPS:ketika checbox dipencet, kembalian value akan berisi inverse/kebalikan dari avalue saat ini
                    //print(value);
                    setState(() {
                      _checkBoxStatus = value!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    /*Navigator.pushReplacementNamed(
                      //Navigator.pushNamed(
                      context,
                      CobaHalamanKosong.nameRoute,
                      arguments: numberButton,
                    );*/
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      CobaHalamanKosong.nameRoute,
                      (route) => false,
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
