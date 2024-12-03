import 'dart:math';
import 'package:flutter/material.dart';

LinearGradient gradientForCard(BuildContext context){
  return LinearGradient(
      transform:GradientRotation(pi/4),
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.tertiary,
      ]
  );
}

LinearGradient gradientForAllItems(BuildContext context){
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Theme.of(context).colorScheme.secondaryContainer,
      Theme.of(context).colorScheme.onSecondaryContainer,
    ],
  );
}