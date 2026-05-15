import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/arguments/products_arguments.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:flutter/material.dart';

class CustomBrandWidget extends StatelessWidget {
  final BrandsEntity brand;
  const CustomBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productsScreenRoute,
          arguments: ProductsArguments(brandId: brand.id),
        );
      },
      child: Column(
        children: [
          CachedNetworkImage(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imageUrl: brand.image,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(100.r),
          //   child: Container(
          //     height: 100.h,
          //     width: 100.w,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //     ),
          //     child: Image.asset(
          //       ImageAssets.brandHomeImage,
          //       fit: BoxFit.scaleDown,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
