import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';

import '../shared/components.dart';
class BusinessScreen extends StatelessWidget {
   const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
    builder:(context,state){
      var list=NewsCubit.get(context).business;
          return ConditionalBuilder(
          condition: state is!GetNewsLoadingState,
          builder:(context)=>ListView.separated(
            physics: ScrollPhysics(),
    itemBuilder:(context,index)=> buildArticalItem( list![index]),
    separatorBuilder:(context,index)=>const Divider(),
    itemCount: 7) ,
    fallback: (context)=>const Center(child: CircularProgressIndicator()));
    });
}
}