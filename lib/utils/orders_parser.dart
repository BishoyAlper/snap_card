import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:snap_card/models/orders_model.dart';

class OrderParser {
  static Future<List<OrderModel>> loadOrders() async {
    final jsonString = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData.map((order) => OrderModel.fromJson(order)).toList();
  }
}
