import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;

  final bool? isLoading;
  final double? height;
  final Color? color;
  final String? text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  const CustomButton(
      {super.key,
      required this.onTap,
      this.text,
      this.height,
      this.isLoading = false,
      this.color,
      this.width,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      height: height,
      minWidth: width,
      disabledColor: Colors.grey,
      shape: StadiumBorder(),
      onPressed: onTap,
      child: Center(
        child: isLoading == true
            ? const CircularProgressIndicator()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text ?? "",
                  style: textStyle,
                ),
              ),
      ),
    );
  }
}
