import 'dart:convert';

import 'dart:ui';

import 'package:get_x_ecommerce/helper/extenstion.dart';

class ProductModel {
  String? name;
  String? image;
  String? description;
  Color? color;
  String? size;
  String? price;
  String? categoryId;
  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.size,
    this.price,
    this.categoryId,
  });
  

  ProductModel copyWith({
    String? name,
    String? image,
    String? description,
    Color? color,
    String? size,
    String? price,
    String? categoryId,
  }) {
    return ProductModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      color: color ?? this.color,
      size: size ?? this.size,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'categoryId': categoryId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'].toString(),
      image: map['image'].toString(),
      description: map['description'].toString(),
      color: HexColor.fromHex(map['color'].toString()),
      size: map['size'].toString(),
      price: map['price'].toString(),
      categoryId: map['CategoryId'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $name, image: $image, description: $description, color: $color, size: $size, price: $price, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.name == name &&
      other.image == image &&
      other.description == description &&
      other.color == color &&
      other.size == size &&
      other.price == price &&
      other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      description.hashCode ^
      color.hashCode ^
      size.hashCode ^
      price.hashCode ^
      categoryId.hashCode;
  }
}
