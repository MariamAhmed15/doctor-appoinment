import 'package:flutter/material.dart';

class specialityWidget extends StatelessWidget {
  const specialityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(244, 248, 255, 1),
              ),
              child: Image.asset("assets/general.png"),
            ),
            SizedBox(height: 8,),
            Text("General")
          ],
        ),
        SizedBox(width: 30,),
        Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(244, 248, 255, 1),
              ),
              child: Image.asset("assets/brain.png"),
            ),
            SizedBox(height: 8,),
            Text("Neurologic")
          ],
        ),
        SizedBox(width: 30,),
        Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(244, 248, 255, 1),
              ),
              child: Image.asset("assets/baby.png"),
            ),
            SizedBox(height: 8,),
            Text("Pediatric")
          ],
        ),
        SizedBox(width: 30,),
        Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromRGBO(244, 248, 255, 1),
              ),
              child: Image.asset("assets/Kidney.png"),
            ),
            SizedBox(height: 8,),
            Text("Radiology")
          ],
        ),
      ],
    );
  }
}
