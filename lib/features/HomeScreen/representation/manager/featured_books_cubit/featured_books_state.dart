import 'package:bookly/features/HomeScreen/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();
  @override
  List<Object> get props => [];
}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccessState(this.books);
}

class FeaturedBooksErrorState extends FeaturedBooksState {
  final String error;

  const FeaturedBooksErrorState(this.error);
}
