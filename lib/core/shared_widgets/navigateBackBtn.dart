import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../Components/CustomText.dart';
import '../themes/AppColors.dart';
class NavigateBackBtn extends StatelessWidget {
  const NavigateBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height/14,
        decoration: BoxDecoration(
            color:AppColor.purple3,
            borderRadius: BorderRadius.circular(6),
        ),
        child:  const Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FluentIcons.arrow_left_12_regular),
            CustomText(text:"Back To Home Screen" , fontSize: 26,),
          ],
        )),
      ),
    );
  }
}
