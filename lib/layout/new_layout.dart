import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';
import 'package:news_app/moudels/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(context)
        ..getDataBusiness()
        ..getDataSports()
        ..getDataScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('NewsApp'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_4_outlined),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SearchScreen();
                    }));
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomNav,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNave(index);
                }),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
