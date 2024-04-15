import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc() : super(BookDetailsInitial()) {
    on<BookDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
