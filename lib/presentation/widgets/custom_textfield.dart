import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final bool isCountryCodeNeeded;
  final String countryCode;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final bool isSuffixNeeded;
  final bool isCounterTextNeeded;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final bool isMandatory;
  final bool? enabled;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.hintStyle,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines = 1,
    required this.isCountryCodeNeeded,
    this.countryCode = '+91',
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.validator,
    this.isSuffixNeeded = false,
    this.isCounterTextNeeded = false,
    this.suffixIcon,
    this.prefix,
    this.isReadOnly = false,
    this.onTap,
    this.isMandatory = false,
    this.enabled,
    this.focusNode,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TEXT FIELD CONTAINER
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor ?? ColorResources.white,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            border: Border.all(
              color:
                  widget.borderColor ??
                  (_errorText != null
                      ? Colors.red
                      : ColorResources.textFieldBorderColor),
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              if (widget.isCountryCodeNeeded) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                  child: Text(
                    widget.countryCode,
                    style: context.textStyle1.s14.w300,
                  ),
                ),
              ],
              Expanded(
                child: TextFormField(
                  enabled: widget.enabled,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChanged,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  focusNode: widget.focusNode,
                  validator: (value) {
                    final text = widget.validator?.call(value);
                    setState(() => _errorText = text);
                    return text; // Return actual error to make Form.validate() work
                  },
                  readOnly: widget.isReadOnly,
                  style: baseTextStyle.s14.w300.black,
                  onTap: widget.isReadOnly ? widget.onTap : null,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      height: 0,
                      fontSize: 0,
                    ), // Hide default error text
                    hint: RichText(
                      text: TextSpan(
                        text: widget.hintText,
                        style: widget.hintStyle ?? context.hintText.s12.w300,
                        children: [
                          TextSpan(
                            text: widget.isMandatory ? '*' : '',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    prefixIcon: widget.prefix,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    counterText:
                        widget.isCounterTextNeeded && widget.maxLength != null
                        ? 'Max. ${widget.maxLength} Characters'
                        : '',
                    counterStyle: context.hintText.s10.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: widget.suffixIcon,
              ),
            ],
          ),
        ),

        // ERROR TEXT OUTSIDE CONTAINER
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Text(
              _errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }
}
