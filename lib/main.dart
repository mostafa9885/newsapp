import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/Local/cache_helper.dart';
import 'package:newsapp/Network/Remote/dio_helper.dart';
import 'package:newsapp/Shared/Cubit/app_cubit.dart';
import 'package:newsapp/Shared/Cubit/app_states.dart';
import 'package:newsapp/Shared/Cubit/cubit.dart';

import 'LayOut/news_layout.dart';
import 'Shared/Style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
            create: (context) => NewsCubit()..getBusiness()
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..ChangeMode(
              fromShared: isDark,
            ),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const Directionality(
              child: NewsLayout(),
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
