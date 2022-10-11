import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

part 'log_in_states.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(LogInInitial());

  static LogInCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  void changeObscure(){
     isPassword = !isPassword;
     emit(IsObscurePasswordState());
  }
  void userLogIn({
  required String email,
    required String password,
}){
    emit(LoginLoadingState());
    AppDio.postData(url: LOGIN, data: {
      "email":email,
      "password":password,
    }).then((value) {
      print(value?.data);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }
}
