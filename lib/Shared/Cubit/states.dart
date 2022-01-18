
abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class AppBottomNavigationBarIndexState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates
{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates
{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates
{
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErrorState extends NewsStates
{
  final String error;

  NewsSearchErrorState(this.error);
}

