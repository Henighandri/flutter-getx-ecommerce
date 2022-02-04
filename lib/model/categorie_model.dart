import 'dart:convert';

class CategorieModel {
  String? icon;
  String? label;
  String? idCategory;
  CategorieModel({
    this.icon,
    this.label,
    this.idCategory,
  });
  

  

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'label': label,
      'idCategory': idCategory,
    };
  }

  factory CategorieModel.fromMap(Map<String, dynamic> map) {
    return CategorieModel(
      icon: map['icon'],
      label: map['label'],
      idCategory: map['idCategory'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategorieModel.fromJson(String source) => CategorieModel.fromMap(json.decode(source));

}
