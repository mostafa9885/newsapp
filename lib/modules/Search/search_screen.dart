import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Components/components.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';
import 'package:newsapp/Shared/Cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFromFieldDefualt(
                  styleOutDecoration: TextStyle(color: Colors.grey[500]),
                  borderRadiusCircular: 30,
                  controller: searchController,
                  label: 'Search',
                  labelStyle: const TextStyle(
                      color: Colors.grey
                  ),
                  hintText: 'Enter Title',
                  prefixIcon: Icons.search,
                  prefixIconColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  validator: (String? value)
                  {
                    if(value!.isEmpty){return 'This Field not be Empty';}
                  },
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value!);
                  },
                ),
              ),
              separatorBuilder(),
              Expanded(child: articleBuilder(list, context))
            ],
          ),
        );
      },
    );
  }
}
