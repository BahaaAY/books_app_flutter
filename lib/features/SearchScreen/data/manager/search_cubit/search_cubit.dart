import 'package:bookly/features/SearchScreen/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchBooks({required String? query}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.searchBooks(query: query ?? '');
    result.fold((failure) {
      emit(SearchErrorState(failure.errorMsg));
    }, (books) {
      emit(SearchSuccessState(books));
    });
  }
}
