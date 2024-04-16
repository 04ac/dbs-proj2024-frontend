import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:online_bookstore/repositories/auth_repo.dart';
import 'package:online_bookstore/repositories/wishlist_repo.dart';

import '../../../models/book.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc() : super(BookDetailsInitial()) {
    on<AddBookToWishlistActionEvent>(addBookToWishlistActionEvent);
    on<RemoveBookFromWishlistActionEvent>(removeBookFromWishlistActionEvent);
  }

  FutureOr<void> addBookToWishlistActionEvent(
      AddBookToWishlistActionEvent event,
      Emitter<BookDetailsState> emit) async {
    try {
      if (AuthRepo.currentUser!.wishList.contains(event.book)) {
        emit(BookAlreadyThereInWishlistActionState());
        return;
      }
      emit(AddingToWishListActionState());
      final res = await WishlistRepo.addToWishList(event.book);

      if (res.statusCode == 200) {
        emit(AddedToWishlistActionState());
      } else {
        emit(UnableToAddToWishlistActionState());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(UnableToAddToWishlistActionState());
    }
  }

  FutureOr<void> removeBookFromWishlistActionEvent(
      RemoveBookFromWishlistActionEvent event,
      Emitter<BookDetailsState> emit) async {
    try {
      if (!AuthRepo.currentUser!.wishList.contains(event.book)) {
        emit(BookNotThereInWishlistActionState());
        return;
      }
      emit(RemovingFromWishListActionState());
      final res = await WishlistRepo.removeFromWishList(event.book);

      if (res.statusCode == 200) {
        emit(RemovedFromWishlistActionState());
      } else {
        emit(
            UnableToAddToWishlistActionState()); // Displays Oops, an error occurred!
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(
          UnableToAddToWishlistActionState()); // Displays Oops, an error occurred!
    }
  }
}
