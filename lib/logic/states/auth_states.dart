class authStates{}
class authInitialState extends authStates{}
class authLoadingState extends authStates{}
class authSuccessState extends authStates{
  final String message;
  final String token;
  authSuccessState(this.message,this.token);
}
class authErrorState extends authStates{
  final String error;
  authErrorState(this.error);
}