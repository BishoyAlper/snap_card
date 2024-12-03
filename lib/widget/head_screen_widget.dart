import 'package:flutter/material.dart';
import 'package:snap_card/utils/strings_manager.dart';

import '../utils/app_style.dart';

class HeadScreenWidget extends StatelessWidget{
  final String? titleScreen;
  const HeadScreenWidget({required this.titleScreen});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text(StringManager.welcome, style: AppStyle.textStyle14.copyWith(color: Theme.of(context).colorScheme.outline,),),
        Text(titleScreen!, style: AppStyle.textStyle18.copyWith(color: Colors.black))
      ],
    );

  }

}