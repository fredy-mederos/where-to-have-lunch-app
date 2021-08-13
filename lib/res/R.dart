import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/generated/l10n.dart';

const int _MAX_SIZE = 600;

class R {
  static S get string => S.current;

  static bool isSmallWidthSize(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.width;
    return shortestSide < _MAX_SIZE;
  }

  static bool isSmallHeightSize(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.height;
    return shortestSide < 400;
  }
}
