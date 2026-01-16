import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? elevation;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool? hideShadow;
  final bool isLoading;
  final String? prefixImage;
  final double? prefixImageSize;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.elevation,
    this.textStyle,
    this.width,
    this.isLoading = false,
    this.height,
    this.hideShadow = false,
    this.prefixImage,
    this.prefixImageSize,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(30);

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: effectiveBorderRadius,
          border: Border.all(
            color: borderColor ?? ColorResources.secondary,
            width: 0.5,
          ),
          boxShadow: hideShadow != true
              ? [
                  // Drop shadow - matches Figma: X:0, Y:6, Blur:20, Spread:0
                  BoxShadow(
                    color: ColorResources.primary.withOpacity(0.15),
                    offset: const Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorResources.primary,
            foregroundColor: foregroundColor ?? ColorResources.white,
            padding: padding ?? const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: effectiveBorderRadius),
            elevation: 0, // Remove default elevation to use custom shadows
            shadowColor: Colors.transparent,
          ),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      foregroundColor ?? ColorResources.white,
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixImage != null) ...[
                      Image.asset(
                        prefixImage!,
                        width: prefixImageSize ?? 20,
                        height: prefixImageSize ?? 20,
                        color: foregroundColor ?? ColorResources.white,
                      ),
                      gap8,
                    ],
                    Text(
                      text,
                      style: textStyle ?? context.heading.w400.s24.white,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}