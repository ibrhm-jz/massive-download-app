// part of 'book_cubit.dart';

// abstract class BookState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class BookInitial extends BookState {}

// class BookLoading extends BookState {
//   final int progress;
//   BookLoading(this.progress);

//   @override
//   List<Object> get props => [progress];
// }

// class BookLoaded extends BookState {}

// class BookError extends BookState {
//   final String message;
//   BookError(this.message);

//   @override
//   List<Object> get props => [message];
// }

import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {}

class BookInitial extends BookState {
  List<Object> get props => [];
}

class BookLoading extends BookState {
  final double progress;
  BookLoading(this.progress);

  @override
  List<Object> get props => [progress];
}

class BookLoaded extends BookState {
  final List<dynamic> books;
  BookLoaded(this.books);
  @override
  List<Object> get props => [books];
}

class BookError extends BookState {
  final String message;
  BookError(this.message);

  @override
  List<Object> get props => [message];
}
