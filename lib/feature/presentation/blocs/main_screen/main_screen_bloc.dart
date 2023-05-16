import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/dish_repository.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(
      {required UserRepository userRepository,
      required DishRepository dishRepository})
      : _userRepository = userRepository,
        _dishRepository = dishRepository,
        super(MainScreenInitial()) {
    on<HomePressed>(_onHomePressed);
    on<FavoritePressed>(_onFavoritePressed);
    on<CartPressed>(_onCartPressed);
    on<ProfilePressed>(_onProfilePressed);
    on<FavoriteStatusToggledOnHome>(_onStatusTooggledHomePage);
    on<FavoriteStatusToggledOnFavorite>(_onStatusTooggledFavoritePage);
  }
  final UserRepository _userRepository;
  final DishRepository _dishRepository;

  Future<void> _onHomePressed(
    HomePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _userRepository.getUser(event.id);
    final list = _dishRepository.getDishesWithFavorite(user.favoriteList);

    emit(HomeSelected(user: user, list: list));
  }

  Future<void> _onFavoritePressed(
    FavoritePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _userRepository.getUser(event.id);
    emit(FavoriteSelected(
      user: user,
    ));
  }

  Future<void> _onCartPressed(
    CartPressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _userRepository.getUser(event.id);
    emit(CartSelected(user: user));
  }

  Future<void> _onProfilePressed(
    ProfilePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _userRepository.getUser(event.id);
    emit(ProfileSelected(user: user));
  }

  Future<void> _onStatusTooggledHomePage(
    FavoriteStatusToggledOnHome event,
    Emitter<MainScreenState> emit,
  ) async {
    final dish = event.dishItem;
    final user = await _userRepository.toggleFavorite(
      event.id,
      dish.toModel(),
    );
    final uptadedList =
        _dishRepository.getDishesWithFavorite(user.favoriteList);
    emit(HomeSelected(user: user, list: uptadedList));
  }

  Future<void> _onStatusTooggledFavoritePage(
    FavoriteStatusToggledOnFavorite event,
    Emitter<MainScreenState> emit,
  ) async {
    final dish = event.dishItem;
    final user = await _userRepository.toggleFavorite(
      event.id,
      dish.toModel(),
    );

    emit(FavoriteSelected(
      user: user,
    ));
  }
}
