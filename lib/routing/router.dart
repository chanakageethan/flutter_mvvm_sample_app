import 'package:flutter_mvvm_sample_app/routing/routes.dart';
import 'package:flutter_mvvm_sample_app/ui/home/home_screen.dart';
import 'package:flutter_mvvm_sample_app/ui/product/view_models/product_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/product/screens/products_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.todosScreen,
      builder: (context, state) {
        return ProductsScreen(
          viewModel: ProductViewModel(productRepository: context.read()),
        );
      },
    ),
  ],
);
