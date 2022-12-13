// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aden/feature/project/model/tags_model.dart';

class ItemsModel {
  final String items_id;
  final String name;
  final int quantity;
  final double price;
  final int minumum_level;
  final double total_value;
  final List<TagsModel>? tags;
  final String? notes;
  final DateTime updatedDate;
  ItemsModel({
    required this.items_id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.minumum_level,
    required this.total_value,
    this.tags,
    this.notes,
    required this.updatedDate,
  });

  ItemsModel copyWith({
    String? items_id,
    String? name,
    int? quantity,
    double? price,
    int? minumum_level,
    double? total_value,
    List<TagsModel>? tags,
    String? notes,
    DateTime? updatedDate,
  }) {
    return ItemsModel(
      items_id: items_id ?? this.items_id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      minumum_level: minumum_level ?? this.minumum_level,
      total_value: total_value ?? this.total_value,
      tags: tags ?? this.tags,
      notes: notes ?? this.notes,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items_id': items_id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'minumum_level': minumum_level,
      'total_value': total_value,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'notes': notes,
      'updatedDate': updatedDate.millisecondsSinceEpoch,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      items_id: map['items_id'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      minumum_level: map['minumum_level'] as int,
      total_value: map['total_value'] as double,
      tags: map['tags'] != null
          ? List<TagsModel>.from(
              (map['tags'] as List<int>).map<TagsModel?>(
                (x) => TagsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      updatedDate:
          DateTime.fromMillisecondsSinceEpoch(map['updatedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemsModel(items_id: $items_id, name: $name, quantity: $quantity, price: $price, minumum_level: $minumum_level, total_value: $total_value, tags: $tags, notes: $notes, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(covariant ItemsModel other) {
    if (identical(this, other)) return true;

    return other.items_id == items_id &&
        other.name == name &&
        other.quantity == quantity &&
        other.price == price &&
        other.minumum_level == minumum_level &&
        other.total_value == total_value &&
        listEquals(other.tags, tags) &&
        other.notes == notes &&
        other.updatedDate == updatedDate;
  }

  @override
  int get hashCode {
    return items_id.hashCode ^
        name.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        minumum_level.hashCode ^
        total_value.hashCode ^
        tags.hashCode ^
        notes.hashCode ^
        updatedDate.hashCode;
  }
}
