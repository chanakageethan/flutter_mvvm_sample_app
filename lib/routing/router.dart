import 'package:flutter_mvvm_sample_app/routing/routes.dart';
import 'package:flutter_mvvm_sample_app/ui/home/cart/cart_screen.dart';
import 'package:flutter_mvvm_sample_app/ui/home/screens/home_screen.dart';
import 'package:flutter_mvvm_sample_app/ui/home/screens/product_details_screen.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/cart_view_model.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/home_view_model.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/product_details_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen(
          viewModel: HomeViewModel(productRepository: context.read()),
        );
      },
    ),

    GoRoute(
      path: '${Routes.productDetailsScreen}/:productId',
      builder: (context, state) {
        final productId = state.pathParameters['productId']!;
        return ProductDetailsScreen(
          productId: productId,
          viewModel: ProductDetailsViewModel(
            productRepository: context.read(),
            productId: productId,
          ),
        );
      },
    ),

    GoRoute(
      path: Routes.cartScreen,
      builder: (context, state) {
        return CartScreen(
          viewModel: CartViewModel(cartRepository: context.read()),
        );
      },
    ),
  ],
);
