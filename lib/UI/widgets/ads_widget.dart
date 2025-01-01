import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colorsManager.dart';

class adsWidget extends StatelessWidget {
  const adsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 343,
          height: 167,
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(height: 15,),
                  Text("Book and",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                  Text("schedule with",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                  Text(" nearest Doctor.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    child: Center(
                      child: Text("Find Nearby",
                        style:TextStyle(
                          color: ColorsManager.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                    width: 109,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Spacer(),
              Image.asset("assets/doctorhome.png",
                height: 197,
                width: 136,)
            ],
          ),
        ),

      ],
    );
  }
}