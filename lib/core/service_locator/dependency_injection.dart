import 'package:dio/dio.dart';
import 'package:doctors_speciality/core/networking/api_service.dart';
import 'package:doctors_speciality/core/networking/dio_factory.dart';
import 'package:doctors_speciality/features/home/data/api/home_api_service.dart';
import 'package:doctors_speciality/features/home/data/repo/home_repo.dart';
import 'package:doctors_speciality/features/login/data/repo/login_repo.dart';
import 'package:doctors_speciality/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_speciality/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

}