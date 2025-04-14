import 'package:vibemart/features/splash/data/data_source/firebase_splash_service.dart';
import 'package:vibemart/features/splash/domain/repository/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  final FirebaseSplashService _splashService = FirebaseSplashService();

  Future<String?> checkUserRole() async {
    return await _splashService.checkUserRole();
  }
}
