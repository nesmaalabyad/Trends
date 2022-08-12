import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Sports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0.0,
            title: Text(
              "Sports", style: TextStyle(fontSize: 43, color: Colors.white,fontStyle: FontStyle.italic),),
            centerTitle: true,
          ),
          body:
          ListNewsItem(
              context: context, task: NewsCubit.get(context).sports),



        );
      },
    );
  }


}
