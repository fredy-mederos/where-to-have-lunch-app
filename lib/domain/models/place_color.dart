import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PlaceColor extends Equatable {
  final String id;
  final String name;
  final Color color;
  final Color textColor;

  PlaceColor({
    required this.id,
    required this.name,
    required this.color,
    required this.textColor,
  });

  @override
  List<Object?> get props => [id, name, color, textColor];
}
