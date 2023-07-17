part of 'book_details_cubit.dart';

abstract class BookDetailsState extends Equatable {
  const BookDetailsState();

  @override
  List<Object> get props => [];
}

class BookDetailsInitialState extends BookDetailsState {}

class BookDetailsLoadingState extends BookDetailsState {}

class BookDetailsErrorState extends BookDetailsState {
  final String error;

  const BookDetailsErrorState(this.error);
}

class BookDetailsSuccessState extends BookDetailsState {
  final List<BookModel> books;

  const BookDetailsSuccessState(this.books);
}
