import 'package:get_it/get_it.dart';

class DependecyService {
  static final GetIt _getIt = GetIt.instance;
  static GetIt get getIt => _getIt;
}
