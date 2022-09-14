import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class CobaCarouselSlide extends StatefulWidget {
  CobaCarouselSlide({Key? key}) : super(key: key);

  @override
  State<CobaCarouselSlide> createState() => _CobaCarouselSlideState();
}

class _CobaCarouselSlideState extends State<CobaCarouselSlide> {
  static final List<String> _dataCarousel = [
    'assets/images/kost2city1.png',
    'assets/images/kost2city2.png',
    'assets/images/kost2city3.png',
    'assets/images/kost2city4.png',
    'assets/images/kost2city5.png',
  ];

  List<Widget> _widgetCarousel = _dataCarousel.map((item) {
    return Container(
      child: Image.asset(
        item,
        fit: BoxFit.cover,
      ),
    );
  }).toList();

  int _pageNow = 2;
  int _pageNow2 = 2;
  CarouselController buttonController = CarouselController();
  CarouselController buttonController2 = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //NOTE:CAROUSELSLIDER
        //Kalo misal carousel patah2, ubah class jadi stateful
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! CarouselSlider DONE G.DOC
            CarouselSlider(
              carouselController: buttonController2,
              //options ini buat ngatur konfigurasi dari CarouselSlider, bisa height, jumlah fragment, dll
              options: CarouselOptions(
                  height: 200,

                  //initialPage carousel dimulai dari slide ke .... (angka dimulai dari 0)
                  initialPage: _pageNow,

                  //reverse slide ditampilkan dari akhir
                  //reverse: true,

                  //enlargeCenterPage kiri kanan lebih kecil daripada yang tengah
                  enlargeCenterPage: true,

                  //enableInfiniteScroll supaya slide ditampilkan sesuai jumlah aja
                  enableInfiniteScroll: false,
                  autoPlay: true,

                  //autoPlayAnimationDuration durasi transisi (bukan durasi berapa lama slide ditampilkan)
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),

                  //autoPlayInterval durasi lama slide ditampilkan
                  autoPlayInterval: Duration(milliseconds: 2000),
                  autoPlayCurve: Curves.easeInOutBack,

                  //viewportFraction lebari slide, jadi lebar diatur disini bukan di child container, dari 0 sampai 1 yang mewakilkan persentase lebar device
                  viewportFraction: 0.4,

                  //scrollDirection arah scroll
                  //scrollDirection: Axis.vertical

                  //aspectRation cuma bisa bekerja apabila height tidak ada
                  //aspectRatio: 0.8,
                  onPageChanged: (index, other) {
                    setState(() {
                      _pageNow = index;
                    });
                  }),
              items: _dataCarousel.map((item) {
                //Builder gawajib, ini cuma buat ngasih informasi posisi context kita sekarang
                return Builder(
                  builder: (context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        //height gaperlu dikasih karena otomatis mengikuti setting
                        //width sebenarnya bisa kita masukkan angka suka2, tapi sebaiknya pake media query aja biar ngikutin ukuran context dari widget CarouselSlider()
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_pageNow + 1}',
                style: cPoppinsWhiteMedium18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //NOTES:asMap.entries untuk memetekan sebuah list kedalam entry
              children: _dataCarousel.asMap().entries.map((entry) {
                //! GestureDetector DONE G.DOC
                return GestureDetector(
                  onTap: () {
                    //buttonController.jumpToPage(entry.key);
                    buttonController2.animateToPage(
                      entry.key,
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: Container(
                    width: _pageNow == entry.key ? 25 : 15,
                    height: 15,
                    margin: EdgeInsets.only(
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                            .withOpacity(_pageNow == entry.key ? 1 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            //! NOTEL Divider adalah pembatas
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: _widgetCarousel,
              carouselController: buttonController,
              options: CarouselOptions(
                  initialPage: _pageNow2,
                  height: 200,
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  onPageChanged: (index, other) {
                    setState(() {
                      _pageNow2 = index;
                    });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    buttonController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.swipe_left_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_pageNow2 + 1}',
                    style: cPoppinsWhiteMedium18,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    buttonController.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.swipe_right_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _dataCarousel.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    //buttonController.jumpToPage(entry.key);
                    buttonController.animateToPage(
                      entry.key,
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: Container(
                    width: _pageNow2 == entry.key ? 25 : 15,
                    height: 15,
                    margin: EdgeInsets.only(
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amber
                            .withOpacity(_pageNow2 == entry.key ? 1 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
