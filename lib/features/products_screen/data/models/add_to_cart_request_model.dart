import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_model.g.dart';

@JsonSerializable()
class AddToCartRequestModel {
  @JsonKey(name: 'productId')
  final String? productId;

  AddToCartRequestModel({
    this.productId,
  });

  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);
}
