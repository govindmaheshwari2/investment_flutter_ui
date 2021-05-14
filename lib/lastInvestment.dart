import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investment/dataset.dart';

class LastInvestment extends StatelessWidget {

  double calculatePie(int value) {
    int total = lastInvestment[0].value + lastInvestment[1].value +
        lastInvestment[2].value;
    double result = (value/total)*100;
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 20),
      width: 350,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [BoxShadow(color: Colors.black54,offset: Offset(0,0),blurRadius: 15)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Last investments",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 120,height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          child: PieChart(PieChartData(sections:
              [
                PieChartSectionData(value: calculatePie(lastInvestment[0].value),color: Colors.greenAccent,radius:16,showTitle: false),
                PieChartSectionData(value: calculatePie(lastInvestment[1].value),color: Colors.orangeAccent,radius:18,showTitle: false),
                PieChartSectionData(value: calculatePie(lastInvestment[2].value),color: Colors.blue,radius:14,showTitle: false)
              ]
                          ,centerSpaceRadius: 30,sectionsSpace:5)),
                        ),
                      ),
                      Positioned(child: Center(child: Container(child: Text((lastInvestment[0].value + lastInvestment[1].value +
                          lastInvestment[2].value).toString()+"\$",style: TextStyle(fontSize: 12),),))),
                    ],
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.trip_origin,color: Colors.greenAccent,size: 15,),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lastInvestment[0].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          SizedBox(height:3),
                          Text("+\$"+lastInvestment[0].value.toString(),style: TextStyle(color: Colors.black54),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.trip_origin,color: Colors.orangeAccent,size: 15,),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lastInvestment[1].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          SizedBox(height:3),
                          Text("+\$"+lastInvestment[1].value.toString(),style: TextStyle(color: Colors.black54),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.trip_origin,color: Colors.blue,size: 15,),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lastInvestment[2].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          SizedBox(height:3),
                          Text("+\$"+lastInvestment[2].value.toString(),style: TextStyle(color: Colors.black54),),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
