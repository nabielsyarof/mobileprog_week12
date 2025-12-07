import 'package:get_it/get_it.dart';
import 'services/auth_service.dart';
import 'controllers/auth_controller.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Daftarkan service
  locator.registerLazySingleton<AuthService>(() => AuthService());

  // Controller
  locator.registerFactory<AuthController>(
      () => AuthController(locator<AuthService>()));
}