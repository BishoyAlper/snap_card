import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_card/utils/app_style.dart';
import 'package:snap_card/utils/strings_manager.dart';

import 'gradient_widget.dart';

class SummaryCard extends StatelessWidget {
  final double averagePrice;
  final int returnedOrders;
  final int totalOrders;

  const SummaryCard({
    required this.averagePrice,
    required this.returnedOrders,
    required this.totalOrders,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: gradientForCard(context),
          boxShadow:const [
            BoxShadow(
                blurRadius: 5.0,
                color: Colors.black,
                offset: const Offset(2, 2)
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.averagePrice, style: AppStyle.textStyle18.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text('\$ ${averagePrice.toInt()}', style: AppStyle.textStyle40,),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mainCardInfo(iconColor: Colors.green.shade600, icon: CupertinoIcons.return_icon, nameOfField: StringManager.totalReturns, numOfField: returnedOrders, textDirection: TextDirection.ltr),
                mainCardInfo(iconColor: Colors.red, icon: Icons.input, nameOfField: StringManager.totalOrders, numOfField: totalOrders, textDirection: TextDirection.rtl)
              ],
            ),
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }

  Widget mainCardInfo({required Color iconColor, required IconData icon, required String nameOfField, required int? numOfField, required TextDirection textDirection}){
    return Row(
      textDirection: textDirection,
      children: [
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white30
          ),
          child: Icon(icon, size: 14.0, color: iconColor,),
        ),
        const SizedBox(width: 8.0,),
        Column(
          children: [
            Text(
              nameOfField, style: AppStyle.textStyle14,
            ),
            Text('${numOfField}', style: AppStyle.textStyle18,),
          ],
        )
      ],
    );
  }
}