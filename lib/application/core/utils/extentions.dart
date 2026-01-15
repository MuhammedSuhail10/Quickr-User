import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/theme/theme/theme_cubit.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';

extension BuildContextX on BuildContext {
  AppThemeMode get theme => read<ThemeCubit>().state.themeMode;
  AppThemeMode get theme1 => read<ThemeCubit>().state.themeMode;

  TextStyle get body =>
      Theme.of(this).textTheme.bodyMedium!.copyWith(fontFamily: AppFonts.body);
  Size get getSize => MediaQuery.sizeOf(this);

  TextStyle get textStyle1 {
    final base = Theme.of(
      this,
    ).textTheme.bodyMedium!.copyWith(fontFamily: AppFonts.body);

    return theme == AppThemeMode.light
        ? base.copyWith(color: ColorResources.textColor)
        : base.copyWith(color: ColorResources.white);
  }

  TextStyle get textStyle2 {
    return Theme.of(this).textTheme.bodySmall!.copyWith(
      fontFamily: AppFonts.body,
      color: ColorResources.primary,
    );
  }

  TextStyle get heading {
    switch (theme) {
      case AppThemeMode.light:
        return Theme.of(this).textTheme.headlineSmall!.copyWith(
          fontFamily: AppFonts.heading,
          color: ColorResources.textColor,
        );
      case AppThemeMode.dark:
        return Theme.of(this).textTheme.headlineSmall!.copyWith(
          fontFamily: AppFonts.heading,
          color: ColorResources.white,
        );
    }
  }

  TextStyle get hintText {
    return Theme.of(this).textTheme.bodySmall!.copyWith(
      fontFamily: AppFonts.body,
      color: ColorResources.grey,
    );
  }

  TextStyle get resetText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.heading,
      color: ColorResources.textColor,
    );
  }

  TextStyle get whiteText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.heading,
      color: ColorResources.white,
    );
  }

  TextStyle get primaryText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.heading,
      color: ColorResources.textColor,
    );
  }

  TextStyle get secondaryText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.heading,
      color: ColorResources.textColor,
    );
  }

  TextStyle get redText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.heading,
      color: ColorResources.red,
    );
  }

  TextStyle get policyText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.body,
      color: ColorResources.textColor,
    );
  }

  TextStyle get subTitleText {
    return Theme.of(this).textTheme.headlineSmall!.copyWith(
      fontFamily: AppFonts.body,
      color: ColorResources.grey,
    );
  }
}

extension StringCapitalization on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    }

    List<String> words = split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    return words.join(" ");
  }

  String toAppDateFormat() {
    try {
      DateTime dt = DateTime.parse(this).toLocal(); // convert to local time

      return DateFormat("dd MMM yyyy | hh:mm a").format(dt);
    } catch (e) {
      return this; // return original if parsing fails
    }
  }

  String toAppDateFormatShort() {
    try {
      DateTime dt = DateTime.parse(this).toLocal(); // convert to local time

      return DateFormat("dd MMM yyyy").format(dt);
    } catch (e) {
      return this; // return original if parsing fails
    }
  }
}

extension ResponseX on Response {
  bool get isOk => statusCode == 200 || statusCode == 201 || statusCode == 202;
  dynamic get responseData => data['data'];
  String get message => data['message'];
  String get error => data[''];
}

extension FormatDate on DateTime {
  String toYyyyMmDd() {
    final year = this.year.toString();
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
