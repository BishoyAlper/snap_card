import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:snap_card/models/orders_model.dart';
import 'package:snap_card/widget/head_screen_widget.dart';

import '../utils/strings_manager.dart';

class GraphScreen extends StatelessWidget {
  final List<OrderModel> orders;

  GraphScreen({required this.orders});

  @override
  Widget build(BuildContext context) {

    // Group orders by month
    final ordersByMonth = <int, int>{};
    for (var order in orders) {
      final month = order.registered.month; // Extract month from date
      ordersByMonth[month] = (ordersByMonth[month] ?? 0) + 1;
    }

    // Prepare data for the graph
    final barGroups = ordersByMonth.entries.map((entry) {
      return BarChartGroupData(
        x: entry.key, // Month (1-12)
        barRods: [
          BarChartRodData(
            toY: entry.value.toDouble(), // Number of orders
            width: 16,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onSecondaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
                Theme.of(context).colorScheme.tertiary,
              ], // Start and end colors for the gradient
              begin: Alignment.bottomCenter,    // Gradient starts from the bottom
              end: Alignment.topCenter,         // Gradient moves to the top
            ),
          ),
        ],
      );
    }).toList();

    // Find the maximum Y value (highest order count)
    final maxOrders = ordersByMonth.values.isNotEmpty
        ? ordersByMonth.values.reduce((a, b) => a > b ? a : b)
        : 0;

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const HeadScreenWidget(titleScreen: StringManager.graphReportpage),
              const SizedBox(height: 8.0,),
              Expanded(
                child: barChartWidget(barGroups: barGroups, maxOrders: maxOrders),
              ),
            ],
          ),
      ),
    );
  }

  Widget barChartWidget({required List<BarChartGroupData> barGroups, required int maxOrders}){
    return BarChart(
      BarChartData(
        barGroups: barGroups,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: TextStyle(fontSize: 12),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final monthNames = StringManager.monthsName;
                return Text(
                  monthNames[value.toInt()],
                  style: TextStyle(fontSize: 10),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true),
        minY: 0, // Start Y-axis at 0
        maxY: (maxOrders + 10).toDouble(), // Set maximum Y value slightly above maxOrders
      ),
    );
  }
}
