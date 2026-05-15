import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
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

  ProductsResponse({
    this.results,
    this.metadata,
    this.data,
    this.statusMsg,
    this.message,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'images')
  final List<String?>? images;
  @JsonKey(name: 'subcategory')
  final List<Subcategory?>? subcategory;
  @JsonKey(name: 'ratingsQuantity')
  final int? ratingsQuantity;
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'imageCover')
  final String? imageCover;
  @JsonKey(name: 'category')
  final Category? category;
  @JsonKey(name: 'brand')
  final Brand? brand;
  @JsonKey(name: 'ratingsAverage')
  final int? ratingsAverage;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Data({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      slug: slug,
      title: title,
      sold: sold,
      brand: brand?.toEntity(),
      category: category?.toEntity(),
    );
  }
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);

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
class Category {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'image')
  final String? image;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

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
class Subcategory {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'category')
  final String? category;

  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
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
