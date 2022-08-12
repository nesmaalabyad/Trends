import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/constance.dart';
import 'package:news_app/dio_helper/signup_and_login_dio_helper.dart';
import 'login_states.dart';

class loginCubit extends Cubit<loginStates> {

  loginCubit() : super(loginintitialstates());

  static loginCubit get(context) => BlocProvider.of(context);


  void usersignup({

    @required email,
    @required password,

  }) {

    SignupAndLoginDio.postData(
        url: 'login',
        data: {

          'email': email,
          'password': password,

        },
        lang: 'en'
    ).then((value) {

      token = value.data['data']['token'].toString();
      emit(getlogindatasucssesstate());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(getlogindataerrorstate(error.toString()));
    });
  }




}