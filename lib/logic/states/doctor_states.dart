import '../../data/doctor_model.dart';

class doctorStates{}
class doctorInitialState extends doctorStates{}
class doctorLoadingState extends doctorStates{}
class doctorSuccessState extends doctorStates{
  final List <Doctor> doctors;
  doctorSuccessState (this.doctors);
}
class doctorErrorState extends doctorStates{
  final String error;
  doctorErrorState(this.error);
}