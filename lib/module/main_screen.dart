import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:snap_card/models/orders_model.dart';
import 'package:snap_card/screens/graph_screen.dart';
import 'package:snap_card/screens/insights_screen.dart';

import '../utils/strings_manager.dart';

class MainScreen extends StatefulWidget {
  final List<OrderModel> orders;
  const MainScreen({required this.orders});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _screens.add(InsightsScreen(orders: widget.orders));
    _screens.add(GraphScreen(orders: widget.orders));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: GNav(
            activeColor: Theme.of(context).colorScheme.secondaryContainer,
            tabBackgroundColor: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(.2),
            gap: 4,
            onTabChange: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.ac_unit,
                text: StringManager.insights,
              ),
              GButton(
                icon: Icons.insights,
                text: StringManager.graph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
