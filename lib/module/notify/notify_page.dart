import 'package:flutter/material.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';
import 'package:test_internship_enlab/themes/styles_text.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({Key? key}) : super(key: key);

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  var indexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _widgetAppBar(),
        body: _widgetBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.chat,
            color: Colors.blue,
          ),
          onPressed: () {},
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  AppBar _widgetAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: _widgetAppLeading(),
      title: _widgetAppBarTitle(),
      actions: [
        SizedBox(
          width: 50,
        )
      ],
    );
  }

  Widget _widgetAppLeading() {
    return Row(
      children: [
        SizedBox(
          width: 10.r,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.r,
            width: 30.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey,
                size: 20.r,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetAppBarTitle() {
    return Center(
      child: Text(
        "Thông báo",
        style: StylesText.header3.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _widgetBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 12.h,
          bottom: 8.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            _widgetMenu(),
            SizedBox(
              height: 20.h,
            ),
            _widgetListCartItem(),
          ],
        ),
      ),
    );
  }

  Widget _widgetMenu() {
    return ValueListenableBuilder(valueListenable: indexNotifier, builder: (context, value, child) {
      return Container(
        width: 1.sw,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetItemMenu(index: 0, currentIndex: value, title: "Tất cả"),
            _widgetItemMenu(index: 1, currentIndex: value, title: "Nhắc nhở"),
            _widgetItemMenu(index: 2, currentIndex: value, title: "Voucher"),
            _widgetItemMenu(index: 3, currentIndex: value, title: "Sự kiện"),
          ],
        ),
      );
    },);
  }

  Widget _widgetItemMenu(
      {required String title, required int index, required int currentIndex}) {
    return InkWell(
      onTap: (){
        indexNotifier.value = index;
      },
      child: Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 8.r, right: 8.r, bottom: 3.r, top: 3.r),
          decoration: BoxDecoration(
              border: Border(
            bottom: index == currentIndex
                ? BorderSide(color: Colors.blue, width: 2.r)
                : BorderSide(
                    color: Colors.transparent,
                  ),
          )),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: index == currentIndex ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetListCartItem() {
    return Column(
      children: [
        _widgetCardItem(),
        _widgetCardItem(),
        _widgetCardItem(),
        _widgetCardItem(),
      ],
    );
  }

  Widget _widgetCardItem({
    String? image,
    String? name,
    String? address,
    String? location,
  }) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1.r),
        ),
      ),
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45.r,
            width: 45.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.r),
                border: Border.all(color: Colors.grey, width: 1.r)),
            child: Center(
              child: Icon(
                Icons.add_alert_outlined,
                size: 38.r,
              ),
            ),
          ),
          SizedBox(
            width: 8.r,
          ),
          Expanded(
            child: Container(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nhắt nhở",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.black),
                      ),
                      Text(
                        "...",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.r,
                  ),
                  Text(
                    "Lịch hẹn kiểm tra xe máy định kỳ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text(
                    "Bạn có lịch hẹn kiểm tra xe Honda Vision 2018 vào hôm nay lúc 15:20",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text(
                    "14:00 24/05/2023",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
