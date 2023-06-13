import 'package:flutter/material.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(right: 10.r),
      decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130.h,
            width: 1.sw,
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15.r),
              image: DecorationImage(
                image: NetworkImage("https://media.hanamtv.vn/upload/image/202203/medium/73653_32bed7ac7afd97cecd6e352b88d823fa.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          Text(
            "Lịch lái thử Honda Tháng 4: Sẵn sàng cho những trả ngiệm đỉnh cao",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
