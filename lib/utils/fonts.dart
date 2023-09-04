import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle _font = GoogleFonts.inter();

  //*static final font16gray = _font.copyWith();

  static final font16w700  =_font.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.24,
        );
  static final h3  =_font.copyWith(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.21,
  );
  static final h4 = _font.copyWith(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.14,
  );
  static final textBold = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.18,
  );
  static final text = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.18,
  );
  static final textCompact = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final textTiny = _font.copyWith(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static final micro = _font.copyWith(
    color: Colors.white,
    fontSize: 8,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.12,
  );
  static final price = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.18,
  );
  static final sale = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.84,
  );
  static final font18w700 = _font.copyWith(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.27,
  );
  static final font8w700 = _font.copyWith(
    color: Colors.white,
    fontSize: 8,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.12,
  );
  static final button = _font.copyWith(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.36,
  );
  static final buttonDefault = _font.copyWith(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.24,
  );
  static final buttonSmall = _font.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.18,
  );
  static final font16w600 = _font.copyWith(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
  );
}