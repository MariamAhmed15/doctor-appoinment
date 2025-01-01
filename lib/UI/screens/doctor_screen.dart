import 'package:dio/dio.dart';
import 'package:doctor_appointment/UI/screens/home_screen.dart';
import 'package:doctor_appointment/UI/widgets/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/doctor_cubit.dart';
import '../../logic/states/doctor_states.dart';

class doctorScreen extends StatelessWidget {
   doctorScreen({super.key});

TextEditingController searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => doctorCubit(Dio())..getAllDoc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<doctorCubit, doctorStates>(
          builder: (context, state) {
            if (state is doctorLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is doctorSuccessState) {
              final doctors = state.doctors;

              return SingleChildScrollView(





                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          // Back Button
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color.fromRGBO(237, 237, 237, 1),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios, size: 18),
                            ),
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            "Recommendation Doctor",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  BlocProvider.of<doctorCubit>(context).getAllDoc(value);
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color.fromRGBO(194, 194, 194, 1),
                                  ),
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                    color: Color.fromRGBO(194, 194, 194, 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.sort),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Doctor List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: doctorWidget(doctor: doctor),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is doctorErrorState) {
              // Display error message
              return Center(child: Text(state.error));
            }

            // Default case
            return const Center(child: Text('No data available.'));
          },
        ),
      ),
    );
  }
}