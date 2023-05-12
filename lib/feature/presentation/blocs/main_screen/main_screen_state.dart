part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class Loadig extends MainScreenState {}

class HomeSelected extends MainScreenState {
  const HomeSelected({required this.user});
  final UserEntity user;
}

class FavoriteSelected extends MainScreenState {
  const FavoriteSelected({required this.user});
  final UserEntity user;
}

class CartSelected extends MainScreenState {
  const CartSelected({required this.user});
  final UserEntity user;
}

class ProfileSelected extends MainScreenState {
  const ProfileSelected({required this.user});
  final UserEntity user;
}
