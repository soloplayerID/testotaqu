// ignore_for_file: must_be_immutable

part of 'models.dart';

class Avail {
  String name;
  String price;
  String images;
  String type;

  Avail({required this.name, required this.price, required this.images,
      required this.type});
}

class AvailModel {
  List<Avail> avails = [];
}
