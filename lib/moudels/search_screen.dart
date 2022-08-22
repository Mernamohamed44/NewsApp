import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';

import '../shared/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var list = NewsCubit.get(context).search;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (value) {
                      NewsCubit.get(context).getDataSearch(value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label: Text('Search'), prefixIcon: Icon(Icons.search)),
                  ),
                ),
                Expanded(child: buildScreenItem(list, isSearch: true))
              ],
            );
          }),
    );
  }
}
