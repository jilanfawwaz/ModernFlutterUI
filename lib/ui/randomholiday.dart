import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
//! Done Screen G.Doc

class RandomHoliday extends StatelessWidget {
  const RandomHoliday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dayCard(
        {required String day,
        required String date,
        bool isSelected = false,
        bool isAvailable = true}) {
      return Container(
        width: 80,
        height: 100,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: isAvailable ? Color(0xffFFFFFF) : Color(0xffF4F4F6),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: cPoppinsWhiteMedium18.copyWith(
                      fontSize: 20,
                      color:
                          isAvailable ? Color(0xff000000) : Color(0xffBABAC8),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    date,
                    style: cPoppinsGreyRegular14.copyWith(
                      fontSize: 12,
                      color:
                          isAvailable ? Color(0xff000000) : Color(0xffBABAC8),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: isSelected
                  ? isAvailable
                      ? Container(
                          width: 27,
                          height: 25,
                          padding: EdgeInsets.fromLTRB(4, 6, 7, 3),
                          decoration: BoxDecoration(
                            color: Color(0xff3F6DF6),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/6-logoCheck2.png",
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        )
                      : SizedBox()
                  : SizedBox(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFAFBFF),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 307,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(170),
                //     bottomRight: Radius.circular(170),
                //   ),
                //   color: Colors.green,
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/7-gambarDestination.png"),
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(200, 100),
                  ),
                  color: Colors.green,
                ),
              ),
              Center(
                child: Text(
                  "Arrinass La",
                  style: cPoppinsWhiteMedium18.copyWith(
                    fontSize: 26,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "Bali, Dekat Bandung",
                  style: cPoppinsWhiteLight16.copyWith(
                    fontSize: 16,
                    color: Color(0xff2F323A),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: cPoppinsWhiteMedium18.copyWith(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Pantai Pandawa adalah salah satu para kawasan wisata di area Kuta selatan sana Kabupaten Dekat Bandung, Bali.",
                      style: cPoppinsWhiteLight16.copyWith(
                        //fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Booking Now",
                      style: cPoppinsWhiteMedium18.copyWith(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          dayCard(
                            day: "THU",
                            date: "19 JUN",
                          ),
                          dayCard(
                            day: "FRI",
                            date: "20 JUN",
                            isSelected: true,
                          ),
                          dayCard(
                            day: "SAT",
                            date: "21 JUN",
                            isSelected: true,
                          ),
                          dayCard(
                              day: "SUN", date: "22 JUN", isAvailable: false),
                          dayCard(
                            day: "MON",
                            date: "23 JUN",
                          ),
                          dayCard(
                            day: "TUE",
                            date: "24 JUN",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$22,800",
                              style: cPoppinsWhiteMedium18.copyWith(
                                  color: Color(0xff3F6DF6), fontSize: 22),
                            ),
                            Text(
                              "/night",
                              style: cPoppinsWhiteLight16.copyWith(
                                  color: Color(0xff2F323A), fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 28,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            // decoration: BoxDecoration(
                            //   color: Color(0xff3F6DF6),
                            //   borderRadius: BorderRadius.circular(19),
                            // ),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xff3F6DF6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: cPoppinsWhiteSemibold24.copyWith(
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
