import 'package:dio/dio.dart';
import 'package:doctor_appointment/UI/screens/doctor_screen.dart';
import 'package:doctor_appointment/UI/widgets/ads_widget.dart';
import 'package:doctor_appointment/UI/widgets/doctor_widget.dart';
import 'package:doctor_appointment/UI/widgets/specialiity_widget.dart';
import 'package:doctor_appointment/core/colorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/doctor_cubit.dart';
import '../../logic/states/doctor_states.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => doctorCubit(Dio())..getAllDoc(),
      child: Scaffold(
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.message_outlined),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(), // Empty space for the floating button
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    child:Image.asset("assets/profilepic.png"),
                  ),
                  label: '',
                ),
              ],
            ),
            Positioned(
              top: -30,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body:BlocBuilder<doctorCubit, doctorStates>(
          builder: (context, state) {
            if (state is doctorLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is doctorSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text("Hi, Mariam!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  Text("How Are you Today?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: ColorsManager.greyColor,
                                    ),)
                                ],
                              ),
                              Spacer(),
                              CircleAvatar(
                                child: Icon(Icons.notifications_none),
                              ),
                            ],
                          ),
                        ),
                        adsWidget(),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Doctor Speciality",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),),
                            Spacer(),
                          ],
                        ),
                        specialityWidget(),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Recommendation Doctor",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => doctorScreen(),
                                  ),
                                  );
                                },
                                child: Text("See all",
                                  style: TextStyle(
                                    color: ColorsManager.primaryColor,
                                    fontSize: 12,
                                  ),)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 700,
                            child: BlocBuilder<doctorCubit, doctorStates>(
                              builder: (context, state) {
                                if (state is doctorLoadingState) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is doctorSuccessState) {
                                  final doctors = state
                                      .doctors; // Get doctors from the state
                                  return ListView.builder(
                                    itemCount: 10,
                                    // Use the length of the doctor list
                                    itemBuilder: (context, index) {
                                      final doctor = doctors[index]; // Get each doctor from the list
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: doctorWidget(
                                            doctor: doctor), // Pass the doctor object
                                      );
                                    },
                                  );
                                } else if (state is doctorErrorState) {
                                  return Center(child: Text(state.error));
                                }
                                return Center(child: Text("No data available"));
                              },
                            ),
                          ),
                        )

                      ]
                  ),
                ),
              );
            } else if (state is doctorErrorState) {
              // Display error message
              return Center(child: Text(state.error));
            }
              return SizedBox();



          }
          )
          ),
    );
  }
}
