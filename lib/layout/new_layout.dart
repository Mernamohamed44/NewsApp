import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';

class NewsLayout extends StatelessWidget {
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>NewsCubit(context)..getData(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: ( context, state){},
        builder: ( context, state){
          var cubit =NewsCubit.get(context);
           return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: const [Icon(Icons.search)],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNav,
                currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNave(index);
            }
          ),
             body: cubit.screens[cubit.currentIndex],
        );},
      ),
    );
  }
}
