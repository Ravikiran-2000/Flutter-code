import 'package:flutter/material.dart';
import 'package:time_table/enums/padding_type_enum.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double horizontalPadding;
  final double verticalPadding;
  final TextAlign textAlign;
  final bool isResponsive;
  final TextDecoration? textDecoration;
  final PaddingType paddingType;
  final double leftPadding;
  final double rightPadding;
  final double lineHeight;
  final FontStyle fontStyle;
  final TextOverflow textOverflow;
  final int maxLength;

  const PrimaryText(
    this.text, {
    Key? key,
    this.fontColor = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.textAlign = TextAlign.start,
    this.isResponsive = true,
    this.textDecoration,
    this.paddingType = PaddingType.symmetric,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.lineHeight = 1.5,
    this.fontStyle = FontStyle.normal,
    this.textOverflow = TextOverflow.visible,
    this.maxLength = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var truncatedText = text;
    if (maxLength != 0 && truncatedText.length > maxLength) {
      truncatedText = "${truncatedText.substring(0, maxLength - 3)}...";
    }
    return Padding(
      padding: paddingType == PaddingType.symmetric
          ? EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            )
          : EdgeInsets.only(
              left: leftPadding,
              right: rightPadding,
            ),
      child: Text(
        truncatedText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          decoration: textDecoration,
          height: lineHeight,
          fontStyle: fontStyle,
        ),
        textScaleFactor: 1,
        textAlign: textAlign,
      ),
    );
  }

/*double responsiveTextSize() {
    if (isResponsive) {
      if (AppSizes.deviceHeight < ResponsiveScreenSizes.height490) {
        return fontSize - 3;
      } else if (AppSizes.deviceHeight < ResponsiveScreenSizes.height740) {
        return fontSize - 2;
      } else if (AppSizes.deviceHeight < ResponsiveScreenSizes.height880) {
        return fontSize - 1;
      }
    }
    return fontSize;
  }*/
}
