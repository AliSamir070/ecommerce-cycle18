import 'package:ecommerce_app/features/products_screen/domain/entites/add_to_cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'numOfCartItems')
  final int? numOfCartItems;
  @JsonKey(name: 'cartId')
  final String? cartId;
  @JsonKey(name: 'data')
  final Data? data;
  @JsonKey(name: 'statusMsg')
  final String? statusMsg;

  AddToCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
    this.statusMsg,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);

  AddToCartEntity toEntity() => AddToCartEntity(message: message ?? "");
}

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'cartOwner')
  final String? cartOwner;
  @JsonKey(name: 'products')
  final List<Products?>? products;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  @JsonKey(name: 'totalCartPrice')
  final int? totalCartPrice;

  Data({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Products {
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'product')
  final String? product;
  @JsonKey(name: 'price')
  final int? price;

  Products({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
