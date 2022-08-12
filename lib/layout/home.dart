import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/buisness.dart';
import 'package:news_app/screens/economy.dart';
import 'package:news_app/screens/health.dart';
import 'package:news_app/screens/science.dart';
import 'package:news_app/screens/sports.dart';
import 'package:news_app/screens/technology.dart';

class Home extends StatefulWidget {
  // const sportsScreen({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final List<String> imageList = ["https://images.skynewsarabia.com/images/v2/2020/09/06/1373993/1200/630/1-1373993.png",
    'https://i.ytimg.com/vi/rCAbB9sXzug/maxresdefault.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfk_iviM35TMjyKOtrEpmmBkLvdzgB3GZnvi57KdiC8OoLVkEuS-LsxSEydRdK2dwXCQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF1-YNjz9g3EVxkoaBlAEd9cSZ93f6ZqaRJlvJLSJfilgFxSuyF5_AH1vkxW4lSDTY1Q0&usqp=CAU',
    'https://play-lh.googleusercontent.com/VzxxO_i6tAyrGhNYl3lzGIILFPGBvapK1bWK4OVxFObox0CDswDhS3Q4NEjCrwdYcLE'
  ];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          body:
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 5.0),

            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.blue[200]),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),

                      reverse: false,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,



                    ),
                    itemBuilder: (context, i, id){

                      return
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,),
                           color: Colors.blue[200]
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child:
                              imageList[i]==null?Container(
                               decoration: BoxDecoration(color: Colors.blue[200]),
                              ):
                              Image.network(
                                imageList[i],
                                width: 950,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );


                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  height: 200.0,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sports()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                    "https://cdn.britannica.com/84/139484-050-D91679CC/Michael-Ballack-Germany-Italy-Cristian-Zaccardo-March-1-2006.jpg"),
                              ),
                              Text('الرياضه',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => health()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                    "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/97727/s960_COVID_960x640.jpg"),
                              ),
                              Text('الصحه',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,fontStyle: FontStyle.italic),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Science()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/photos/micorscope-is-used-by-researcher-who-use-her-hands-holding-and-picture-id1213724568?s=612x612"),
                            ),
                            Text('العلوم',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,fontStyle: FontStyle.italic),),
                          ],
                        ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => technology()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://www.businessnewsupdates.org/wp-content/uploads/2021/06/Top-10-Trending-Technologies-a-Software-Engineer-Should-Know.jpg"),
                            ),
                            Text('التكنولوجيا',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,fontStyle: FontStyle.italic),),
                          ],
                        ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Buisness()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-photo/attractive-businesswoman-holding-meeting_1098-17754.jpg?w=996"),
                            ),
                            Text('السيايه',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,fontStyle: FontStyle.italic),),
                          ],
                        ),
                        ),
                      ),



                    ],
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 5.0),
                  height: 520,
                  child:
                  ListNewsItem(
                     context: context, task:
                  NewsCubit.get(context).general,
                  ),


                ),
              ],
            ),
          ),




        );
      },
    );
  }
}
