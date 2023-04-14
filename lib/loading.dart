import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.isStyle1 = true,
    this.strokeWidth = 2,
    this.loadingText,
    this.loadingTextStyle,
    this.size,
  }) : super(key: key);

  final bool isStyle1;
  final String? loadingText;
  final TextStyle? loadingTextStyle;
  final double strokeWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (isStyle1) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
                color: Theme.of(context).progressIndicatorTheme.color,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                strokeWidth: strokeWidth),
            SizedBox(height: height * 0.01),
            Text(
              loadingText ?? 'Please wait..',
              style: loadingTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          height: size ?? height * 0.035,
          width: size ?? height * 0.035,
          child: CircularProgressIndicator(
              color: Theme.of(context).progressIndicatorTheme.color,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              strokeWidth: strokeWidth),
        ),
      );
    }
  }
}
