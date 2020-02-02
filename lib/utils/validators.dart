import 'package:where_to_have_lunch/res/R.dart';

String validatorRequired(String value) {
  if (value.isEmpty) {
    return R.string.requiredField;
  }
  return null;
}
