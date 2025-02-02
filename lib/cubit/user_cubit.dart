import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/model/models.dart';
import 'package:food_app/service/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  
  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await Userservice.signIn(email, password);
    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(FailedUserLoaded(result.message!));
    }
  }
}
