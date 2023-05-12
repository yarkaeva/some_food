part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent({required this.id});
  final String id;

  @override
  List<Object> get props => [];
}

class HomePressed extends MainScreenEvent {
  const HomePressed({required super.id});
}

class FavoritePressed extends MainScreenEvent {
  const FavoritePressed({required super.id});
}

class CartPressed extends MainScreenEvent {
  const CartPressed({required super.id});
}

class ProfilePressed extends MainScreenEvent {
  const ProfilePressed({required super.id});
}
