import 'package:bookly/features/HomeScreen/data/repos/home_repo.dart';
import 'package:bookly/features/HomeScreen/representation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksErrorState(failure.errorMsg));
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
