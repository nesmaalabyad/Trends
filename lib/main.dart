import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/signup.dart';
import 'package:news_app/screens/splash_screen.dart';

import 'cubit/app_cubit.dart';
import 'cubit/bloc_observer/my_bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/login_cubit.dart';
import 'cubit/signup_cubit.dart';
import 'dio_helper/dio_helper.dart';
import 'dio_helper/signup_and_login_dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SignupAndLoginDio.init();
  BlocOverrides.runZoned(
        () {
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:( context)=>NewsCubit(),),
        BlocProvider(
          create: (BuildContext context)=>NewsCubit()..getSports()..getBuisness()..getEconomy()..gethealth()..getScience()..getTechnology()..getgeneral(),),
        BlocProvider(create:( context)=>loginCubit(),),
        BlocProvider(
          create: (BuildContext context)=>loginCubit(),),
        BlocProvider(create:( context)=>signupCubit(),),
        BlocProvider(
          create: (BuildContext context)=>signupCubit(),),
        BlocProvider(create:( context)=>AppCubit(),),
        BlocProvider(
          create: (BuildContext context)=>AppCubit(),),
      ],
      child: BlocConsumer<NewsCubit,Newsstates>(
          listener: (context,states){},
          builder:(context,states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'shop',
              theme: ThemeData(

              ),
              home: SplashScreen(),
              //804946c446d74bc897d25f4e04d5482f
            );
          }

      ),
    );
  }
}


