import 'package:ecommerce_app/core/arguments/products_arguments.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_states.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_view_model.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  final ProductsArguments arguments;
  const ProductsScreen({super.key, required this.arguments});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsViewModel>().getProducts(
          categoryId: widget.arguments.categoryId,
          brandId: widget.arguments.brandId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener<ProductsViewModel, ProductsStates>(
      listenWhen: (previous, current) =>
          current is AddToCartLoadingState ||
          current is AddToCartSuccessState ||
          current is AddToCartFailureState,
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 14,
          );
        }

        if (state is AddToCartFailureState) {
          Fluttertoast.showToast(
            msg: state.failureMessage,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14,
          );
        }
      },
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              BlocBuilder<ProductsViewModel, ProductsStates>(
                buildWhen: (previous, current) =>
                    current is ProductsLoadingState ||
                    current is ProductsSuccessState ||
                    current is ProductsFailureState,
                builder: (context, state) {
                  switch (state) {
                    case ProductsInitialState():
                      return SizedBox.shrink();
                    case ProductsLoadingState():
                      return const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    case ProductsSuccessState():
                      return Expanded(
                        child: GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return CustomProductWidget(
                              id: product.id ?? "",
                              image: product.imageCover ?? "",
                              title: product.title ?? "",
                              price: product.price?.toDouble() ?? 0,
                              rating: product.ratingsAverage?.toDouble() ?? 0,
                              discountPercentage: 10,
                              height: height,
                              width: width,
                              description: product.description ?? "",
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      );
                    case ProductsFailureState():
                      return Expanded(
                          child: Center(child: Text(state.message)));
                    default:
                      return SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
