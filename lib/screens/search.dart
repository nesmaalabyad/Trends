import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Search'),),
          body:Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormFieldCusstom(
                  controller: searchController,
                  label: 'Search',
                    type: TextInputType.text,

                    suffixIcon: Icons.search,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  }
                ),
              ),
              Expanded(child: ListNewsItem(
                  context: context,
                  task:NewsCubit.get(context).search ,
                  isSearch: true,
              ),
              ),
            ],
          )

        );
      },
    );
  }
}
