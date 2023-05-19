import 'package:bloc/bloc.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

enum RoleState { unknown, customer, performer }

class UserRoleCubit extends Cubit<RoleState> {
  UserRoleCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(RoleState.unknown);

  final UserRepository _userRepository;

  Future<void> getRole(String userId) async {
    final user = await _userRepository.getUser(userId);
    if (user.role == Role.customer) {
      return emit(RoleState.customer);
    } else if (user.role == Role.perfomer) {
      return emit(RoleState.performer);
    }
  }

  void becomeCustomer() {
    if (state == RoleState.performer) return emit(RoleState.customer);
  }

  void becomePerformer() {
    if (state == RoleState.customer) return emit(RoleState.performer);
  }
}
