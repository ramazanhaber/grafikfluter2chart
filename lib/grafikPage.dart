import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikPage extends StatefulWidget {
  const GrafikPage({Key? key}) : super(key: key);

  @override
  State<GrafikPage> createState() => _GrafikPageState();
}

class _GrafikPageState extends State<GrafikPage> {

  late TooltipBehavior _tooltipBehavior;

  Widget grafikContent() {
    return Center(
        child: Container(
            child: SfCartesianChart(

                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: _tooltipBehavior,

                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      dataSource:  <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40),
                        SalesData('Tan', 90),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true)
                  )
                ]
            )
        )
    );
  }


  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grafik 33 "),),
      body: Container(child: grafikContent(),),);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
