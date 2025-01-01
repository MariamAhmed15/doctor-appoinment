import 'package:doctor_appointment/UI/screens/home_screen.dart';
import 'package:doctor_appointment/UI/screens/login_screen.dart';
import 'package:doctor_appointment/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/colorsManager.dart';
import '../../logic/cubit/auth_cubit.dart';
import '../../logic/states/auth_states.dart';

class signUpScreen extends StatelessWidget {
  final TextEditingController nameController= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  final TextEditingController phoneController= TextEditingController();
  final TextEditingController genderController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();

   signUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context)=>authCubit(),
      child: BlocConsumer <authCubit, authStates>(
      listener: (context , state){
        if (state is authLoadingState){
          Center(child: CircularProgressIndicator());
        }
        else if (state is authSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sign Up is successful")),
          );
          Navigator.push(context, MaterialPageRoute(builder: (context)=>homeScreen(),));
        }else if(state is authErrorState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder:(context, state){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 94,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17,),
                child: Text("Create Account",
                  style: TextStyle(
                    color:ColorsManager.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text("Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:17),
                child: Container(
                  width: 327,
                  height: 60,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      hintStyle: TextStyle(color:Color.fromRGBO(237, 237, 237, 1)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:17),
                child: Container(
                  width: 327,
                  height: 60,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color:Color.fromRGBO(237, 237, 237, 1)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:17),
                child: Container(
                  width: 327,
                  height: 60,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color:Color.fromRGBO(237, 237, 237, 1)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:17),
                child: Container(
                  width: 327,
                  height: 60,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: TextStyle(color:Color.fromRGBO(237, 237, 237, 1)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:17),
                child: Container(
                  width: 327,
                  height: 60,
                  child: TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      hintStyle: TextStyle(color:Color.fromRGBO(237, 237, 237, 1)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 52,
                  width: 311,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(36, 124, 255, 1),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        final register= UserModel(name: nameController.text, email: emailController.text, phone: phoneController.text, gender: genderController.text, password: passwordController.text);
                        context.read<authCubit>().signUp(register);
                        Navigator.push(context, MaterialPageRoute(
                            builder:(context)=> homeScreen()
                        ),
                        );
                      },
                      child: Text("Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder:(context)=> LoginScreen()
                        ),
                        );
                      },
                      child: Text("Log In",
                        style: TextStyle(
                          color: ColorsManager.primaryColor,
                        ),))
                ],
              )

            ],

          ),
        );
      },



      )  );
  }
}

