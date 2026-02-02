import 'package:flutter_mvvm_sample_app/routing/routes.dart';
import 'package:flutter_mvvm_sample_app/ui/home/home_screen.dart';
import 'package:flutter_mvvm_sample_app/ui/home/view_models/home_view_model.dart';
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

  ],
);
