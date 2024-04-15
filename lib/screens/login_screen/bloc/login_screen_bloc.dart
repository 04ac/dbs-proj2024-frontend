import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_bookstore/repositories/auth_repo.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<InvalidUnamePassEntered>(invalidUnamePassEntered);
    on<CreateCustomerEvent>(createCustomerEvent);
  }

  FutureOr<void> invalidUnamePassEntered(
      InvalidUnamePassEntered event, Emitter<LoginScreenState> emit) {
    emit(DisplayInvalidUnamePwdSnackBarActionState());
  }

  FutureOr<void> createCustomerEvent(
      CreateCustomerEvent event, Emitter<LoginScreenState> emit) async {
    final res = await AuthRepo.createCustomer(event.uname, event.passwd);

    if (res.statusCode == 200) {
      emit(DisplayHomeScreenActionState());
    } else {
      emit(CustomerCreationNotSuccessfulActionState());
    }
  }
}
