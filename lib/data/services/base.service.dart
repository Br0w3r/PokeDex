import 'package:pokedex/data/providers/api.provider.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
}
