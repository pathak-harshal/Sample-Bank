import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../stores/login_store.dart';
import 'api_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  final apiRepository = ApiRepository();
  const secureStorage = FlutterSecureStorage();
  locator
      .registerSingleton<LoginStore>(LoginStore(apiRepository, secureStorage));
}
