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

class FavoriteStatusToggledOnHome extends MainScreenEvent {
  const FavoriteStatusToggledOnHome({
    required super.id,
    required this.dishItem,
  });
  final DishEntity dishItem;
}

class FavoriteStatusToggledOnFavorite extends MainScreenEvent {
  const FavoriteStatusToggledOnFavorite({
    required super.id,
    required this.dishItem,
  });
  final DishEntity dishItem;
}

class CartPressed extends MainScreenEvent {
  const CartPressed({required super.id});
}

class ProfilePressed extends MainScreenEvent {
  const ProfilePressed({required super.id});
}

class DeleteProfilePressed extends MainScreenEvent {
  const DeleteProfilePressed({required super.id});
}

class UserIsCustomerPressed extends MainScreenEvent {
  const UserIsCustomerPressed({required super.id});
}

class UserIsPerformerPressed extends MainScreenEvent {
  const UserIsPerformerPressed({required super.id});
}
