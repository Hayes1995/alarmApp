import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Category {
  Category({required this.id, required this.title, this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
}
