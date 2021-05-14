import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investment/dataset.dart';

class Investment extends StatelessWidget {
  const Investment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF020063),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => Navigator.pop(context)),
          title: Text("Investment tools"),
        ),
        body: Stack(alignment: Alignment.topCenter, children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Color(0xFF020063),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          Column(
            children: [Market(), Recommended(), Return()],
          )
        ]));
  }
}

class Return extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Return on Investment",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15,),
          Container(
            height: 120,
            child: LineChart(LineChartData(
                titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: false),
                    bottomTitles: SideTitles(
                      showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff008cff),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return 'J';
                            case 2:
                              return 'F';
                            case 3:
                              return 'M';
                            case 4:
                              return 'A';
                            case 5:
                              return 'M';
                            case 6:
                              return 'J';
                            case 7:
                              return 'J';
                            case 8:
                              return 'A';
                            case 9:
                              return 'S';
                            case 10:
                              return 'O';
                            case 11:
                              return 'N';
                            case 12:
                              return 'D';
                          }
                          return '';
                        })),
                minX: 0,
                maxX: 12,
                minY: 0,
                maxY: 12,
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      isCurved: true,
                      colors: [
                        const Color(0xff23b6e6),
                        const Color(0xff02d39a),
                      ],
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(show: true, colors: [
                        ColorTween(
                                begin: Color(0xff23b6e6),
                                end: Color(0xff02d39a))
                            .lerp(0.2)
                            .withOpacity(0.1),
                        ColorTween(
                                begin: Color(0xff23b6e6),
                                end: Color(0xff02d39a))
                            .lerp(0.2)
                            .withOpacity(0.1),
                      ]),
                      aboveBarData: BarAreaData(show: true, colors: [
                        ColorTween(
                                begin: Color(0xff23b6e6),
                                end: Color(0xff02d39a))
                            .lerp(0.2)
                            .withOpacity(0.1),
                        ColorTween(
                                begin: Color(0xff23b6e6),
                                end: Color(0xff02d39a))
                            .lerp(0.2)
                            .withOpacity(0.1),
                      ]),
                      spots: [
                        FlSpot(0, 0),
                        FlSpot(1, 3),
                        FlSpot(2, 4),
                        FlSpot(3, 6),
                        FlSpot(4, 4),
                        FlSpot(5, 6),
                        FlSpot(6, 7),
                        FlSpot(7, 8),
                        FlSpot(8, 7),
                        FlSpot(9, 9),
                        FlSpot(10, 6),
                        FlSpot(11, 8),
                        FlSpot(12, 9),
                      ])
                ])),
          )
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("See all", style: TextStyle(color: Colors.black54))
              ],
            ),
            Column(
              children: [
                RecommendedItem(
                  name: recommendedList[0].name,
                  subtitle: recommendedList[0].subtitle,
                  value: recommendedList[0].value,
                  icon: recommendedList[0].icon,
                ),
                RecommendedItem(
                  name: recommendedList[1].name,
                  subtitle: recommendedList[1].subtitle,
                  value: recommendedList[1].value,
                  icon: recommendedList[1].icon,
                ),
                RecommendedItem(
                  name: recommendedList[2].name,
                  subtitle: recommendedList[2].subtitle,
                  value: recommendedList[2].value,
                  icon: recommendedList[2].icon,
                ),
              ],
            )
          ],
        ));
  }
}

class RecommendedItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String icon;
  final String value;
  RecommendedItem({this.name, this.subtitle, this.icon, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: AssetImage(icon)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(subtitle, style: TextStyle(color: Colors.black54))
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent),
            ),
          )
        ],
      ),
    );
  }
}

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Currency market",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Open chart", style: TextStyle(color: Colors.black54))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Currency(
                    currency: "EUR/USD",
                    value: "14,321",
                  ),
                  Currency(
                    currency: "USD/GBP",
                    value: "11,321",
                  ),
                  Currency(
                    currency: "USD/RUB",
                    value: "10,321",
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class Currency extends StatelessWidget {
  final String currency;
  final String value;

  Currency({this.currency, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 120,
      height: 90,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xFF333333).withOpacity(0.14),
                blurRadius: 2,
                offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currency, style: TextStyle(color: Colors.black54)),
          SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
