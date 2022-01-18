import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Network/Remote/dio_helper.dart';
import 'package:newsapp/Shared/Cubit/states.dart';
import 'package:newsapp/modules/Business/business_screen.dart';
import 'package:newsapp/modules/Science/science_screen.dart';
import 'package:newsapp/modules/Settings/settings_screen.dart';
import 'package:newsapp/modules/Sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = const
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined),
        label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  void changeBottomNavigatorBarIndex (int index)
  {
    currentIndex = index;
    if(index == 1)
      getScience();
    if (index == 2)
      getSports();

    emit(AppBottomNavigationBarIndexState());
  }

  List<dynamic> business = [];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());

    if(business.length == 0)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'business',
            'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
          }
      ).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError){
        print('$onError');
        emit(NewsGetBusinessErrorState(onError.toString()));
      });
    }
    else
    {
      emit(NewsGetBusinessSuccessState());
    }
  }


  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
          }
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((onError){
        print('$onError');
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    }
    else
    {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0)
    {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
          }
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((onError){
        print('$onError');
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    }
    else
    {
      emit(NewsGetSportsSuccessState());
    }


  }

  List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '975d7b6f1c9e47dcac206301a11ec09e',
        }
    ).then((value) {
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((onError){
      print('$onError');
      emit(NewsSearchErrorState(onError.toString()));
    });
  }

}
