import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/data/repos/home_repo_impl.dart';
import 'package:bookly/features/HomeScreen/representation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/features/HomeScreen/representation/views/details_view.dart';
import 'package:bookly/features/HomeScreen/representation/views/home_view.dart';
import 'package:bookly/features/SearchScreen/representation/views/search_view.dart';
import 'package:bookly/features/SplashScreen/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 650),
              child: const HomeView(),
              transitionsBuilder: (context, animation, secondary, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: detailsRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: Duration(milliseconds: 300),
              child: BlocProvider<BookDetailsCubit>(
                create: (context) => BookDetailsCubit(
                    homeRepo: getIt.get<HomeRepoImplementaion>()),
                child: DetailsView(book: state.extra as BookModel),
              ),
              transitionsBuilder: (context, animation, secondary, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: searchRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 300),
              child: const SearchView(),
              transitionsBuilder: (context, animation, secondary, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
    ],
  );
}
