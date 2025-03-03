import 'package:dio/dio.dart';
import 'package:doctor_appointment/data/doctor_model.dart';
import 'package:doctor_appointment/logic/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/endpoints.dart';
import '../states/doctor_states.dart';

class doctorCubit extends Cubit <doctorStates> {
  final Dio dio;

  doctorCubit(this.dio) :super(doctorInitialState());
  Future<void> getAllDoc([String doctorName = '']) async {
    emit(doctorLoadingState());
    try {
      final url = doctorName.isEmpty
          ? EndPoints.getDoctorsUrl
          : '${EndPoints.baseUrl}/doctor/doctor-search?name=$doctorName';

      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM4NTczNDU0LCJleHAiOjE3Mzg2NTk4NTQsIm5iZiI6MTczODU3MzQ1NCwianRpIjoiMEpRa29TbDBBQUxmdmM2eCIsInN1YiI6IjI4MCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.OChw8HzgIfuIGRUO7_VWwB3PnwrfTCqKg7SyUhTd3_M',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final List x = response.data['data'];
        final doctors = x.map((json) => Doctor.fromJson(json)).toList();
        emit(doctorSuccessState(doctors));
      } else {
        emit(doctorErrorState("Unexpected error: ${response.statusCode}"));
      }
    } catch (e) {
      emit(doctorErrorState(e.toString()));
    }
  }


}
