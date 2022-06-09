import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryStats extends StatefulWidget {
  const CategoryStats(
      {Key? mykey,
      required this.title,
      required this.nC,
      required this.nW,
      required this.nS})
      : super(key: mykey);
  final String title;
  final int nC;
  final int nW;
  final int nS;

  @override
  State<CategoryStats> createState() => _CategoryStatsState();
}

class _CategoryStatsState extends State<CategoryStats> {
  late List<Stats> _chartData;
  late TooltipBehavior _tooltipBehavior;
  get title => widget.title;
  get nC => widget.nC;
  get nW => widget.nW;
  get nS => widget.nS;
  Widget statBox(String text, int num, Color color) {
    return Container(
      height: 60,
      width: 310,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Text(text + "$num",
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-SemiBold',
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 4.0,
              )),
        ]),
      ),
    );
  }

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AutoSizeText(
            widget.title,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.w700,
              height: 0.8,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            iconSize: 35,
            color: Colors.black,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SfCircularChart(
                title: ChartTitle(
                    text: "Overall Stats of $title",
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1.0,
                      height: 1,
                    )),
                // legend: Legend(
                //   isVisible: true,
                //   overflowMode: LegendItemOverflowMode.wrap,
                // ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  PieSeries<Stats, String>(
                    dataSource: _chartData,
                    pointColorMapper: (Stats data, _) => data.color,
                    xValueMapper: (Stats data, _) => data.stats,
                    yValueMapper: (Stats data, _) => data.percent,
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: false),
                    enableTooltip: true,
                  ),
                ],
              ),
              statBox("Correct: ", nC, const Color.fromRGBO(5, 195, 107, 38)),
              statBox("Wrong: ", nW, const Color.fromRGBO(243, 83, 86, 60)),
              statBox("Skipped: ", nS, const Color.fromRGBO(240, 243, 60, 50)),
            ],
          ),
        ),
      );

  List<Stats> getChartData() {
    final List<Stats> chartData = [
      Stats('Wrong', nW, const Color.fromRGBO(242, 83, 85, 75)),
      Stats('Skipped', nS, const Color.fromRGBO(239, 242, 62, 75)),
      Stats('Correct', nC, const Color.fromRGBO(6, 194, 106, 75)),
    ];
    return chartData;
  }
}

class Stats {
  Stats(this.stats, this.percent, this.color);
  final String stats;
  final int percent;
  final Color color;
}
