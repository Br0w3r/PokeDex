import 'package:get/get.dart';
import 'package:pokedex/app/pages/home/home.controller.dart';
import 'package:pokedex/app/pages/login/login.controller.dart';
import 'package:pokedex/app/pages/splash/splash.controller.dart';
import 'package:pokedex/data/services/pokemons/pokemon.api.service.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(PokemonApiService()));
  }
}
