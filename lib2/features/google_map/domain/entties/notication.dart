import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class Notfication extends Equatable {
  Notfication({required this.title, required this.body});
  String title;
  String body;
}
