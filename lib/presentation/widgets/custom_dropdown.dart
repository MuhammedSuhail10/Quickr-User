import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

class CustomDropdown<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isCountryCodeNeeded;
  final String countryCode;
  final Color? fillColor;
  final Color? borderColor;
  final String? Function(T?)? validator;
  final bool isSuffixNeeded;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool isMandatory;
  final bool? enabled;
  final FocusNode? focusNode;
  final Function(T?)? onChanged;
  final String Function(T)? itemLabelBuilder;

  const CustomDropdown({
    super.key,
    this.value,
    required this.items,
    required this.hintText,
    this.hintStyle,
    required this.isCountryCodeNeeded,
    this.countryCode = '+91',
    this.fillColor,
    this.borderColor,
    this.validator,
    this.isSuffixNeeded = false,
    this.suffixIcon,
    this.prefix,
    this.isMandatory = false,
    this.enabled,
    this.focusNode,
    this.onChanged,
    this.itemLabelBuilder,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  String? _errorText;
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
    }
  }

  void _validateAndUpdate(T? value) {
    if (widget.validator != null) {
      final errorText = widget.validator!(value);
      setState(() => _errorText = errorText);
    }
    setState(() => _selectedValue = value);
    widget.onChanged?.call(value);
  }

  String _getItemLabel(T item) {
    if (widget.itemLabelBuilder != null) {
      return widget.itemLabelBuilder!(item);
    }
    return item.toString();
  }

  List<T> _getUniqueItems() {
    final seenLabels = <String>{};
    final uniqueItems = <T>[];

    for (var item in widget.items) {
      final label = _getItemLabel(item);
      if (!seenLabels.contains(label)) {
        seenLabels.add(label);
        uniqueItems.add(item);
      }
    }

    return uniqueItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DROPDOWN CONTAINER
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor ?? ColorResources.white,
            borderRadius: BorderRadius.circular(18),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<T>(
                    value: _selectedValue,
                    focusNode: widget.focusNode,
                    isExpanded: true,
                    validator: (value) {
                      final text = widget.validator?.call(value);
                      setState(() => _errorText = text);
                      return null; // prevent default error
                    },
                    icon: const SizedBox.shrink(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      enabled: widget.enabled ?? true,
                    ),
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
                    style: baseTextStyle.s14.w300.black,
                    dropdownColor: ColorResources.white,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(12),
                    menuMaxHeight: 300,
                    items: _getUniqueItems().map((T item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: ColorResources.textFieldBorderColor
                                    .withOpacity(0.2),
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _getItemLabel(item),
                                  style: baseTextStyle.s14.w400.black,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (_selectedValue == item)
                                const Icon(
                                  Icons.check,
                                  color: ColorResources.primary,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: widget.enabled ?? true
                        ? _validateAndUpdate
                        : null,
                    selectedItemBuilder: (BuildContext context) {
                      return _getUniqueItems().map((T item) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _getItemLabel(item),
                            style: baseTextStyle.s14.w300.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: widget.isSuffixNeeded
                    ? widget.suffixIcon
                    : const Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorResources.textFieldBorderColor,
                      ),
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
