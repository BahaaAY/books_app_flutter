part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<BookModel> books;

  const SearchSuccessState(this.books);
}

class SearchErrorState extends SearchState {
  final String error;

  const SearchErrorState(this.error);
}
