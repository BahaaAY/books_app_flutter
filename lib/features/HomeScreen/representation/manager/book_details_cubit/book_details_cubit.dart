import 'package:bloc/bloc.dart';
import 'package:bookly/features/HomeScreen/data/models/book_model/book_model.dart';
import 'package:bookly/features/HomeScreen/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit({required this.homeRepo}) : super(BookDetailsInitialState());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(BookDetailsLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(BookDetailsErrorState(failure.errorMsg));
    }, (books) {
      emit(BookDetailsSuccessState(books));
    });
  }
}
