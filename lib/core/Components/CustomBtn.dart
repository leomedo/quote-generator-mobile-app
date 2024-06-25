import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {


  final void Function()? onTap;
  final String? text;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? btnHeight;
  final double? btnWidth;
  final double? borderWidth;
  final double? fontSize;
  final BorderRadiusGeometry? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  const CustomButton({super.key,required this.text , required this.color , required this.onTap , this.borderColor , this.textColor , this.btnHeight , this.borderWidth , this.icon , this.iconColor , this.borderRadius,this.btnWidth , this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: btnHeight,
        width: btnHeight,
        decoration: BoxDecoration(
          borderRadius:borderRadius,
          border: Border.all(
            color: borderColor ?? Colors.white ,
            width: borderWidth ?? 0,
          ),
          color: color,
        ),
        child: TextButton(

            onPressed: onTap,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(icon!=null)
                  Icon(icon , color: iconColor,),
                Text( text ?? "No Pain No Gain",
                    style: TextStyle(
                      fontSize:fontSize ,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    )),

              ],
            )));
  }
}