import 'package:flutter/material.dart';
import 'package:snap_card/models/orders_model.dart';
import 'package:snap_card/module/main_screen.dart';
import 'package:snap_card/utils/orders_parser.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Load and parse orders from json
  final orders = await OrderParser.loadOrders();

  runApp(MyApp(orders: orders));
}

class MyApp extends StatelessWidget {
  final List<OrderModel> orders;
  const MyApp({required this.orders});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const Color(0xFF00B2E7),
          secondary: const  Color(0xFFE064F7),
          tertiary: const Color(0xFFFF8D6C),
          secondaryContainer: const Color(0xFF6200EA),
          onSecondaryContainer: const Color(0xFFB388FF)

        ),
        useMaterial3: true,
      ),
      home: MainScreen(orders: orders,),
    );
  }
}



