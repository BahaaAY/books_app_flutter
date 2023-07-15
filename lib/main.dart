import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/HomeScreen/data/repos/home_repo_impl.dart';
import 'package:bookly/features/HomeScreen/representation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/HomeScreen/representation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(getIt.get<HomeRepoImplementaion>());
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(getIt.get<HomeRepoImplementaion>());
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
