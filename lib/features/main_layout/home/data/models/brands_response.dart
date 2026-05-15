import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_response.g.dart';

@JsonSerializable()
class BrandsResponse {
  @JsonKey(name: 'results')
  final int? results;
  @JsonKey(name: 'metadata')
  final Metadata? metadata;
  @JsonKey(name: 'data')
  final List<Data?>? data;
  @JsonKey(name: "statusMsg")
  final String? statusMsg;
  @JsonKey(name: "message")
  final String? message;

  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
    this.statusMsg,
    this.message,
  });

  factory BrandsResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BrandsResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Data({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  BrandsEntity toEntity() {
    return BrandsEntity(
      id: id ?? "",
      image: image ?? "",
      name: name ?? "",
      slug: slug ?? "",
    );
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;
  @JsonKey(name: 'nextPage')
  final int? nextPage;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
