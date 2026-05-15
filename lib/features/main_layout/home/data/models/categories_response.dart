import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
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

  CategoriesResponse({
    this.results,
    this.metadata,
    this.data,
    this.statusMsg,
    this.message,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
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

  CategoriesEntity toEntity() {
    return CategoriesEntity(
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

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
