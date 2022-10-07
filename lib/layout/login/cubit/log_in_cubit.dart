import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_states.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(LogInInitial());

  static LogInCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  void changeObscure(){
     isPassword = !isPassword;
     emit(IsObscurePasswordState());
  }
}
