
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_card/models/orders_model.dart';
import 'package:snap_card/utils/app_style.dart';
import 'package:snap_card/widget/order_card.dart';
import 'package:snap_card/widget/summary_card.dart';

import '../utils/strings_manager.dart';
import '../widget/head_screen_widget.dart';

class InsightsScreen extends StatelessWidget{
  final List<OrderModel> orders;
  const InsightsScreen({required this.orders});

  @override
  Widget build(BuildContext context) {

    final totalOrders = orders.length;
    final averagePrice = orders.map((orders) => orders.price).reduce((a, b) => a + b) / orders.length;
    final returnedOrders = orders.where((orders) => orders.status == "RETURNED").length;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          children: [
            const HeadScreenWidget(titleScreen: StringManager.numericReportPage),
            const SizedBox(height: 20.0,),
            SummaryCard(averagePrice: averagePrice, returnedOrders: returnedOrders, totalOrders: totalOrders),
            const SizedBox(height: 40.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringManager.allOrders, style: AppStyle.textStyle18.copyWith(color: Colors.black),),
                Text(StringManager.viewAll, style: AppStyle.textStyle14.copyWith(color: Theme.of(context).colorScheme.outline,))
              ],
            ),
            const SizedBox(height: 8.0,),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) => OrderCard(orderModel: orders[index]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}