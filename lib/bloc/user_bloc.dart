import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_zentech/bloc/user_event.dart';
import 'package:test_project_zentech/bloc/user_state.dart';
import 'package:test_project_zentech/model/user_model.dart';

import '../model/user_login_model.dart';
import '../repository/repository.dart';

class UserBloc extends Bloc<UserEvent ,UserState> {
  final Repository repo;
  late LoginModel model;
  late UserModel data;

  UserBloc(this.repo) : super(InitialState()){
    on<SubmitEvent>((event, emit) async {
      emit(LoadingState());
      try {
        model = (await  Repository().sendData(event.email ?? 'megha', event.password ?? 'mehah'))!;
        emit(LoadedState(Data: model));
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }

    },);
    on<GetDataEvent>((event, emit) async {
      emit(LoadingState());
      try{
      data = (await Repository().getData())!;
      emit(LoadedDataUser(Data: data));
      }catch(e){
        emit(ErrorState(msg: e.toString()));
      }

    },);

  }


}
