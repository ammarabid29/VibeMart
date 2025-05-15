import 'package:vibemart/features/splash/data/data_source/splash_source.dart';
import 'package:vibemart/features/splash/domain/repository/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  final SplashSource _splashSource = SplashSource();

  Future<String?> checkUserRole() async {
    try {
      return await _splashSource.checkUserRole();
    } catch (_) {
      rethrow;
    }
  }
}
