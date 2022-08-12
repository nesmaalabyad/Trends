import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/constance.dart';
import '../dio_helper/signup_and_login_dio_helper.dart';
import 'app_states.dart';
import 'news_login.dart';


class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(Appintitialstates());

  static AppCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? userModel;
  void getProfileData()
  {
    SignupAndLoginDio.getData(url: 'profile'  , authorization: token )
        .then((value) {
      userModel = ShopLoginModel.fromJson(value.data) ;
      print (value.data) ;
      emit(ShopAppGetProfileDataSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(ShopAppGetProfileDataErrorState()) ;
    });
  }

  void updateProfileData(
      {
        required String name ,
        required String phone ,
        required String email ,
        required String password ,
      }
      )
  {
    emit(ShopAppUpdateProfileDataLoadingState()) ;
    SignupAndLoginDio.putData(path: 'update-profile', data: {
      'name':name ,
      'phone':phone ,
      'email':email ,
      'password':password,
    } , authorization: token)
        .then((value) {
      userModel = ShopLoginModel.fromJson(value.data) ;
      print (value.data) ;
      emit(ShopAppUpdateProfileDataSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(ShopAppUpdateProfileDataErrorState()) ;

    });
  }


}
