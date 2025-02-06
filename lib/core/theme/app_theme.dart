import 'package:flutter/material.dart';

class AppTheme{
  final primary = const Color(0xFF0d8cac);
  final darkPrimary = const Color(0xFF05445e);
  final secondary = const Color(0xFF79c2b6);
  final light = const Color(0xFFc9e7e8);
  final details = const Color(0xFF44acbc);
  final lightGray = const Color(0xFFF0f3F6);
  final black = const Color(0xff0D3F67);
  final  error =  const Color(0xFFCF0303);
  final  errorSnackbar = const Color(0xFFF66464);
  final success = const Color(0xFF86D185).withAlpha(180);
  final sucessSnackbar = const Color(0xFF86D185).withAlpha(180);
  final gray = const Color(0xffB6C5D1);

  late final label11 = TextStyle(
    fontSize: 11,
    color: black,
  );

  late final label11Bold = TextStyle(
    fontSize: 11,
    color: black,
    fontWeight: FontWeight.bold,
  );

  late final field15 = TextStyle(
    fontSize: 15,
    color: black,
  );

  late final body16 = TextStyle(
    fontSize: 16,
    color: black,
  );

  late final body16Bold = TextStyle(
    fontSize: 16,
    color: black,
    fontWeight: FontWeight.bold,
  );

  late final heading36Bold = TextStyle(
    fontSize: 36,
    color: black,
    fontWeight: FontWeight.bold,
  );

  late final heading24Bold = TextStyle(
    fontSize: 24,
    color: black,
    fontWeight: FontWeight.bold,
  );

  static const text = Color(0xFF475467);
  static const priceText = Color(0xFF3A3A40);
  static const priceSubtitle = Color(0xFF495057);
  static const inputText = Color(0xFF667085);
  static const greyButton = Color(0xFF868E96);
  static const selectedFilter = Color(0xFFCED4DA);

  static const warning = Color(0xFFFFAE0D);
  static const background = Color(0xFFFAFAFA);
  static const backgroundCard = Color(0xFFF8F9FA);
  static const backgroundButton = Color(0xFFDEE2E6);
  static const lightest = Color(0xFFFFF4ED);
}