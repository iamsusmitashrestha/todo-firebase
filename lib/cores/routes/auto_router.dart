import 'package:auto_route/auto_route.dart';
import 'package:todo/features/home/home_view.dart';
import 'package:todo/features/register/register_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: RegisterView, initial: true),
  AutoRoute(
    page: HomeView,
  ),
], usesLegacyGenerator: true)
class $AutoRouter {}
