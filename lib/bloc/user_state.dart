import 'package:test_project_zentech/model/user_login_model.dart';
import 'package:test_project_zentech/model/user_model.dart';

abstract class UserState {
  const UserState();
}
class InitialState extends UserState{}
class LoadingState extends UserState{}
class LoadedState extends UserState{
  final LoginModel Data;
  const  LoadedState({required this.Data});
}
class ErrorState extends UserState{
  final String? msg;
  const ErrorState({required this.msg});

}
class LoadedDataUser extends UserState{
  final UserModel Data;
  const  LoadedDataUser({required this.Data});
}
