import 'package:get/get.dart';
import 'package:pokedex/app/pages/home/home.page.dart';
import 'package:pokedex/app/pages/login/login.page.dart';
import 'package:pokedex/app/pages/splash/splash.page.dart';
import 'package:pokedex/core/routes/bindings.dart';
part 'routes.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.main,
        page: () => const HomePage(),
        binding: MainBinding()),
  ];
}
