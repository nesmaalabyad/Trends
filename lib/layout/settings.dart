import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';
import '../components/components.dart';
import '../cubit/app_cubit.dart';
import '../screens/login.dart';

class Settings extends StatelessWidget {

  var nameController = TextEditingController() ;
  var emailController = TextEditingController() ;
  var phoneController = TextEditingController() ;
  var passwordController = TextEditingController() ;
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , Appstates  >(
      listener: (context , state){},
      builder: (context , state){

        var cubit = AppCubit.get(context) ;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (state is ShopAppUpdateProfileDataLoadingState)
                //   LinearProgressIndicator() ,
                // if (state is ShopAppUpdateProfileDataLoadingState)
                SizedBox(height: 20,) ,
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Update Information',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w900),),
                ),
                SizedBox(height: 20,) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldCusstom(
                      controller: nameController,
                      type: TextInputType.text,

                      label: 'Name',
                      suffixIcon: Icons.person),
                ) ,
                SizedBox(height: 15,) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldCusstom(
                      controller: emailController,
                      type: TextInputType.emailAddress,

                      label: 'Email',
                      suffixIcon: Icons.email),
                ) ,
                SizedBox(height: 15,) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldCusstom(
                      controller: phoneController,
                      type: TextInputType.number,

                      label: 'Phone',
                      suffixIcon: Icons.phone),
                ) ,
                SizedBox(height: 15,) ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldCusstom(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,

                      label: 'Password',
                      suffixIcon: Icons.lock),
                ) ,
                SizedBox(height: 10,) ,


                InkWell(
                  onTap: (){
                    cubit.updateProfileData(name: nameController.text, phone: phoneController.text, email: emailController.text,password:passwordController.text,) ;
                   // Text('your information updated successfully!',style: TextStyle(color: Colors.green),);
                    t=true;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blue),
                      padding: EdgeInsets.symmetric(horizontal: 130,vertical: 15),
                      child: Row(
                        children: [
                          Center(child: Text('Update',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                          SizedBox(width: 15,) ,
                          Column(
                            children: [
                              Icon(Icons.update,color: Colors.white,size: 25,),
                            ],
                          ),
                        ],
                      ),


                    ),
                  ),
                ),

                if(t==true&& state is ShopAppUpdateProfileDataSuccessState)
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text('your information updated successfully!',
                      style: TextStyle(color: Colors.green),),
                  ),


              /*  customButton(function: (){
                  cubit.updateProfileData(name: nameController.text, phone: phoneController.text, email: emailController.text) ;
                }, text: 'UPDATE'),
*/
               // SizedBox(height: 20,) ,
               // Spacer() ,

                Padding(
                  padding: const EdgeInsets.only(top:0 ),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.blue),
                        padding: EdgeInsets.symmetric(horizontal: 130,vertical: 20),
                        child: Row(
                          children: [
                            Center(child: Text('Log out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                            SizedBox(width: 15,) ,
                            Column(
                              children: [
                                Icon(Icons.logout,color: Colors.white,size: 25,),
                              ],
                            ),
                          ],
                        ),


                      ),
                    ),
                  ),
                ),
               /* customButton(function: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => login()));
                }, text: 'LOGOUT')*/
              ],
            ),
          ),
        );
      /*  nameController.text = cubit.userModel!.data!.name ;
        emailController.text = cubit.userModel!.data!.email ;
        phoneController.text = cubit.userModel!.data!.phone ;*/
        /*
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConditionalBuilder(
            condition:cubit.userModel!=null,
            fallback: (context)=>Center(child: CircularProgressIndicator()),
            builder: (context)=>Center(

            ),
          ),
        ) ;*/
      },
    ) ;
  }

}
