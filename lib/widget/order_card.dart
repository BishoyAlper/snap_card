import 'package:flutter/material.dart';
import 'package:snap_card/models/orders_model.dart';
import 'package:snap_card/utils/app_style.dart';
import 'package:snap_card/widget/gradient_widget.dart';

class OrderCard extends StatelessWidget {
  final OrderModel orderModel;
  const OrderCard({required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: gradientForAllItems(context),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${orderModel.buyer}", style: AppStyle.textStyle18,
          ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${orderModel.status}',
                    style: AppStyle.textStyle14,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white.withOpacity(
                        0.4,
                      ),
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: Text("\$ ${orderModel.price}"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
