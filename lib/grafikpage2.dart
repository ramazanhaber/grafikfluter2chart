import 'package:flutter/material.dart';
import 'package:grafikfluter2/AltinApi.dart';
import 'package:grafikfluter2/AltinModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrafikPage2 extends StatefulWidget {
   GrafikPage2({Key? key}) : super(key: key);

  @override
  State<GrafikPage2> createState() => _GrafikPage2State();
}

class _GrafikPage2State extends State<GrafikPage2> {

  late TooltipBehavior _tooltipBehavior; // mouse tıklanınca gerçek değeri söyleyen tooltip
  late CrosshairBehavior crosshair; // mouseyi basılı tutunca çıkan x y popup

  late TrackballBehavior _trackballBehavior;

  List<AltinModel> altinDate=[];

  @override
  void initState() {
    super.initState();

    _trackballBehavior = TrackballBehavior(
        enable: true,
        tooltipAlignment: ChartAlignment.near,
        activationMode: ActivationMode.singleTap, // tek dokunuşta göstermesi için
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        tooltipSettings: InteractiveTooltip(
          // Formatting trackball tooltip text
            format: 'point.y' //  point.x\n
        ));

    crosshair = CrosshairBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        hideDelay: 2000,
        shouldAlwaysShow: false,
        lineType: CrosshairLineType.both,
        lineWidth: 1);


    AltinApi api = new AltinApi();
    api.getTumBankaLocal().then((value) {
      altinDate=value;
      setState(() {

      });
    });
    // api.getTumBanka().then((value) {
    //   altinDate=value;
    //   setState(() {
    //
    //   });
    // });
  }

  Widget grafikContent() {
    return Center(
      child: Container(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(labelRotation: 90),
              trackballBehavior: _trackballBehavior,
              // tooltipBehavior: _tooltipBehavior, // sonra açabilirsin
              title: ChartTitle(
                  text: "GRAM ALTIN",
                  textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              series: <LineSeries<AltinModel , String>>[
                LineSeries<AltinModel , String>(
                    dataSource: altinDate,
                    enableTooltip: true,
                    name: "Satış",
                    xValueMapper: (AltinModel sales, _) => sales.kayitTarihi,
                    yValueMapper: (AltinModel sales, _) => sales.satis),
              ])),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grafik Gelişmis"),),
      body: Container(child: grafikContent(),),);
  }
}
