import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/signup_states.dart';
import 'package:news_app/dio_helper/signup_and_login_dio_helper.dart';



class signupCubit extends Cubit<signupStates> {
  signupCubit() : super(signupintitialstates());

  static signupCubit get(context) => BlocProvider.of(context);


  void usersignup({
    @required name,
    @required email,
    @required password,
    @required phone,
  }) {

    SignupAndLoginDio.postData(
      url: 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {

      emit(getsignupdatasucssesstate());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(getsignupdataerrorstate(error.toString()));
    });
  }




}