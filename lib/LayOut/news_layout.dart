
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Components/components.dart';
import 'package:newsapp/Shared/Cubit/app_cubit.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';
import 'package:newsapp/Shared/Cubit/states.dart';
import 'package:newsapp/modules/Search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions:
            [
              IconButton(
                  onPressed:()
                  {
                    NavigatorTo(context, SearchScreen());
                  },
                  icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).ChangeMode();
                },
                icon: const Icon(Icons.brightness_4),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavigatorBarIndex(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
