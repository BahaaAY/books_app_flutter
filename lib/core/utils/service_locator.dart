import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/HomeScreen/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementaion>(
      HomeRepoImplementaion(getIt.get<ApiService>()));
}
