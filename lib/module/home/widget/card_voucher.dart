import 'package:flutter/material.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';

class CardVoucher extends StatelessWidget {
  const CardVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(
                    1, 4), // changes position of shadow
              ),
            ]),
        child: Column(
          children: [
            Container(
              width: 1.sw,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10.r),
                        color: Colors.orangeAccent,
                      image: DecorationImage(
                        image: NetworkImage("https://media.hanamtv.vn/upload/image/202203/medium/73653_32bed7ac7afd97cecd6e352b88d823fa.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.r,
                  ),
                  Expanded(
                    child: Text(
                      "Cửa hàng Honda Quốc Tiến 1",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.r,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giảm 100k",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Khi mua phụ tùng hoặc Bảo dưỡng xe",
                  style: TextStyle(
                      color: Colors.grey, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.r,
            ),
            Container(
              width: double.infinity,
              height: 2.r,
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            ),
            SizedBox(
              height: 8.r,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "100",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      " điểm",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10.r,
                      right: 10.r,
                      top: 5.r,
                      bottom: 5.r),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent),
                  child: Center(
                    child: Text(
                      "Đổi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final dashWidth = 4;
    final dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;
}
