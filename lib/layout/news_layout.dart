import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/settings.dart';
import 'package:news_app/layout/trends.dart';
import 'package:news_app/screens/search.dart';

import '../cubit/app_cubit.dart';
import 'home.dart';

class newslayout extends StatelessWidget {
  // const newslayout({Key? key}) : super(key: key);
  int currentindex = 0;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var taskTitleController = TextEditingController();
  List<Widget> Screens = [
    Trends(),
    Home(),
    Settings(),
  ];



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, Newsstates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
            key: scaffoldkey,
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(NewsCubit.get(context).appbar[currentindex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  )),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => searchScreen()),
                    );
                  },
                ),


              ],
            ),
            body: NewsCubit.get(context)
                .Screens[NewsCubit.get(context).currentindex],
          /*  bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
            unselectedItemColor:Colors.black,
              currentIndex: NewsCubit.get(context).currentindex,
              onTap: (index) {
                NewsCubit.get(context).add(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,

                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.trending_up,

                    ),
                    label: "Trends"),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,

                  ),
                  label: "Settings",
                ),
              ],
            ),*/
              bottomNavigationBar:CurvedNavigationBar(

                height: 50,
                //backgroundColor: Colors.white,
                //flutter build apk --releasecolor:  Colors.blue,
                index: NewsCubit.get(context).currentindex,
                items: <Widget>[
                  Icon(
                    Icons.home,color: Colors.black,size: 30,

                  ),
                  Icon(
                    Icons.trending_up,color: Colors.black,size: 30,

                  ),
                  Icon(
                    Icons.settings,color: Colors.black,size: 30,


                  ),



                ],

                onTap: (index) {
                  debugPrint("index is $index");
               NewsCubit.get(context).add(index);

                },


              )

          );
        });
  }
}
