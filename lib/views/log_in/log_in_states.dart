abstract class LogInViewStates{}

class LogInViewInitialize extends LogInViewStates{}

class LogInViewLoading extends LogInViewStates{}

class LogInViewSuccess extends LogInViewStates{}

class LogInViewFailure extends LogInViewStates{

  final String errMessage;
  LogInViewFailure(this.errMessage);

}

