
// import 'package:boy/Graph/bar_data.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';


// class MyBarGRaph extends StatelessWidget {
//   final List weeklySummary;
//    final List dates;
//   const MyBarGRaph({super.key, required this.weeklySummary,required this.dates});

//   @override
//   Widget build(BuildContext context) {
//     BarData myBarData = BarData(
//         sunAmount: weeklySummary[0],
//         monAmount: weeklySummary[1],
//         tueAmount: weeklySummary[2],
//         wedAmount: weeklySummary[3],
//         thuAmount: weeklySummary[1],
//         friAmount: weeklySummary[2],
//         satAmount: weeklySummary[3],
//         date1: dates[0],date2: dates[1],date3: dates[2],date4: dates[0],date5: dates[3],date6: dates[0],date7: dates[0],
//         );
//     myBarData.initialiseBarData();
//     return BarChart(BarChartData(
//       maxY: 100,
//       minY: 0,
//       gridData: FlGridData(show: true),
//       borderData: FlBorderData(show: true),
//       titlesData: FlTitlesData(
//           show: true,
//           bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                   showTitles: true, getTitlesWidget: getBottomTitles))
//                   ),
//       barGroups: myBarData.barData
//           .map((data) => BarChartGroupData(x: data.x, barRods: [
//                 BarChartRodData(
//                     toY: data.y,
//                     color: Color.fromARGB(255, 10, 90, 144),
//                     width: 25,
//                     borderRadius: BorderRadius.circular(4),
//                     backDrawRodData: BackgroundBarChartRodData(
//                         show: true, toY: 100, color: Colors.grey[200]))
//               ]))
//           .toList(),
//     ));
//   }
// }

// Widget getBottomTitles(double value, TitleMeta meta) {
//   // print(value.toString());
//   const style =
//       TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12);
//   Widget text;
//   switch (value.toInt()) {
//     case 0:
//       text = const Text('2024-05-07 ', style: style);
//       break;
//     case 1:
//       text = const Text('M', style: style);
//       break;
//     case 2:
//       text = const Text('T', style: style);
//       break;
//     case 3:
//       text = const Text('W', style: style);
//       break;
//     case 4:
//       text = const Text('T', style: style);
//       break;
//     case 5:
//       text = const Text('F', style: style);
//       break;
//     case 6:
//       text = const Text('S', style: style);
//       break;
//     default:
//       text = const Text('', style: style);
//       break;
//   }
//   return SideTitleWidget(child: text, axisSide: meta.axisSide);
// }




import 'package:boy/Graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGRaph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGRaph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thuAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initialiseBarData();
    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: true),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles))
                  ),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Color.fromARGB(255, 6, 90, 116),
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: 100, color: Colors.grey[200]))
              ]))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('', style: style);
      break;
    case 1:
      text = const Text('', style: style);
      break;
    case 2:
      text = const Text('', style: style);
      break;
    case 3:
      text = const Text('', style: style);
      break;
    case 4:
      text = const Text('', style: style);
      break;
    case 5:
      text = const Text('', style: style);
      break;
    case 6:
      text = const Text('', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
