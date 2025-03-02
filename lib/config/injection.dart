
import 'package:flutter_exam/config/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init(environment: "prod");
}
