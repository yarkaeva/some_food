import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(repository)
      : _repository = repository,
        super(MainScreenInitial()) {
    on<HomePressed>(_onHomePressed);
    on<FavoritePressed>(_onFavoritePressed);
    on<CartPressed>(_onCartPressed);
    on<ProfilePressed>(_onProfilePressed);
  }
  final UserRepository _repository;

  Future<void> _onHomePressed(
    HomePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _repository.getUser(event.id);
    emit(HomeSelected(user: user));
  }

  Future<void> _onFavoritePressed(
    FavoritePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _repository.getUser(event.id);
    emit(FavoriteSelected(user: user));
  }

  Future<void> _onCartPressed(
    CartPressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _repository.getUser(event.id);
    emit(CartSelected(user: user));
  }

  Future<void> _onProfilePressed(
    ProfilePressed event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(Loadig());
    final user = await _repository.getUser(event.id);
    emit(ProfileSelected(user: user));
  }
}
