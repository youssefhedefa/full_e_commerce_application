abstract class HomeViewStates{}

class HomeViewInitialize extends HomeViewStates {}

class HomeCategoriesLoading extends HomeViewStates {}
class HomeCategoriesSuccess extends HomeViewStates {}
class HomeCategoriesFailure extends HomeViewStates {
  final String errMessage;

  HomeCategoriesFailure(this.errMessage);
}



class HomeNewInLoading extends HomeViewStates {}