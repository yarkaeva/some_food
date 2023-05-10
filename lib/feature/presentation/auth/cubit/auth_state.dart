part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LogedIn extends AuthState {
  final String id;

  const LogedIn({required this.id});
}

class LogedOut extends AuthState {}

class LoginError extends AuthState {}
