import 'package:flutter/services.dart';

class CategoryModel {
  int? member;
  String? name;
  String? desc;
  String? favourite;
  String? admin;
  String? status;
  String? option;
  String? profileImg;
  // Uint8List? profileImg;
  CategoryModel({
    this.name,
    this.desc,
    this.admin,
    this.member,
    this.status,
    this.option,
    this.favourite,
    this.profileImg,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    admin = json['admin'];
    member = json['member'];
    status = json['status'];
    option = json['option'];
    favourite = json['favourite'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    data['admin'] = admin;
    data['member'] = member;
    data['status'] = status;
    data['option'] = option;
    data['favourite'] = favourite;
    data['profileImg'] = profileImg;
    return data;
  }
}

class FilterModel {
  Color? color;
  String? label;
  bool? isSelected;

  FilterModel({
    this.color,
    this.label,
    this.isSelected,
  });
}
