import 'package:doctor_appointment/core/colorsManager.dart';
import 'package:flutter/material.dart';
import '../../data/doctor_model.dart';

class doctorWidget extends StatelessWidget {
  final Doctor doctor;

  const doctorWidget({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Column(
            children: [
    Image.network(
      doctor.photo,
      height: 100,
      width: 100,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child; // If image is loaded
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Center(child: Icon(Icons.error)); // Show error icon if loading fails
      },
    ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,///////
            children: [
              Text(
                doctor.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(doctor.specialization.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.greyColor,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star,
                    color: Colors.yellow,
                    size: 16,),
                  SizedBox(width: 5,),
                  Text("4.8",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.greyColor,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text("(4,279 reviews)",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.greyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      );
  }
}
