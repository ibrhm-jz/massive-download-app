import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {}

class BookInitial extends BookState {
  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {
  final double progress;
  BookLoading(this.progress);

  @override
  List<Object> get props => [progress];
}

class BookError extends BookState {
  final String message;
  BookError(this.message);

  @override
  List<Object> get props => [message];
}
class BookSuccess extends BookState {
  final String message;
  BookSuccess(this.message);

  @override
  List<Object> get props => [message];
}
class BookPaused extends BookState {
  final bool paused;
  BookPaused(this.paused);

  @override
  List<Object> get props => [paused];
}