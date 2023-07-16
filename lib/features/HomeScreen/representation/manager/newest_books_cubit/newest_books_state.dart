part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccessState(this.books);
}

class NewestBooksErrorState extends NewestBooksState {
  final String error;

  const NewestBooksErrorState(this.error);
}
