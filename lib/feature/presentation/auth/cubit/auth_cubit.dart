import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository _repository;

  AuthCubit(this._repository) : super(AuthInitial());

  Future<void> register(UserEntity user) async {
    final userChecked = await _repository.checkEmail(user.email);
    if (userChecked == false) {
      await _repository.addUser(user);
      emit(LogedIn(id: user.id));
    } else {
      emit(LoginError());
    }
  }

  Future<void> login(String email, String password) async {
    final user = await _repository.checkUser(email, password);
    if (user == null) {
      emit(LoginError());
    } else {
      emit(LogedIn(id: user.id));
    }
  }

  Future<void> logout() async {
    emit(LogedOut());
  }
}
