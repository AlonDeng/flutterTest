import 'package:flutter/material.dart';
import 'package:alon/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget _btnText({
  required VoidCallback onPressed,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String? fontName,
  bool isbgColor = true,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextButton(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(
        fontSize: 16.sp,
      )),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (!isbgColor) {
            return null;
          }
          if (states.contains(MaterialState.focused) &&
              !states.contains(MaterialState.pressed)) {
            return Colors.blue;
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.deepPurple;
          }
          return fontColor;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.blue[50];
        }
        return isbgColor ? gbColor : null;
      }),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      )),
    ),
    onPressed: onPressed,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: fontColor,
        fontFamily: fontName,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    ),
  );
}

/// 扁平圆角按钮
Widget btnWidget({
  required VoidCallback onPressed,
  double? width,
  double? height,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color? fontColor,
  double fontSize = 18,
  // String fontName = "Montserrat",
  String? fontName,
  FontWeight fontWeight = FontWeight.w400,
  bool isFlex = false, // 是否使用flex 佈局
  bool isbgColor = true, // 是否使用背景色
}) {
  final fontColor =
      isbgColor ? AppColors.primaryElementText : AppColors.primaryText;
  return isFlex
      ? SizedBox.expand(
          child: _btnText(
            fontWeight: fontWeight,
            fontName: fontName,
            fontSize: fontSize,
            onPressed: onPressed,
            gbColor: gbColor,
            title: title,
            fontColor: fontColor,
            isbgColor: isbgColor,
          ),
          // child: Text('123'),
        )
      : SizedBox(
          width: width?.w,
          height: height?.h,
          child: _btnText(
            fontWeight: fontWeight,
            fontName: fontName,
            fontSize: fontSize,
            onPressed: onPressed,
            gbColor: gbColor,
            title: title,
            isbgColor: isbgColor,
            fontColor: fontColor,
          ),
        );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
