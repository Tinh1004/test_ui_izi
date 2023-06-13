import 'package:flutter/material.dart';
import 'package:test_internship_enlab/common/widget/button/main_button.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';
import 'package:test_internship_enlab/themes/styles_text.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _widgetAppBar(),
      body: _widgetBody(),
    ));
  }

  AppBar _widgetAppBar(){
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      leading: _widgetAppLeading(),
      title: _widgetAppBarTitle(),
      actions: [
        SizedBox(width: 50,)
      ],
    );
  }

  Widget _widgetAppLeading(){
    return Row(
      children: [
        SizedBox(width: 10.r,),
        InkWell(
          onTap: (){
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
              child: Icon(Icons.arrow_back, color: Colors.grey,size: 20.r,),
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetAppBarTitle(){
    return Center(
      child: Text(
        "Danh sách đại lý",
        style: StylesText.header3.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _widgetBody(){
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
            _widgetSearch(),
            SizedBox(
              height: 12.h,
            ),
            _widgetListCartItem(),
          ],
        ),
      ),
    );
  }

  Widget _widgetSearch(){
    return Container(
      width: 1.sw,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.r,
            width: 50.r,
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: 'Tìm kiếm theo tên đại lý',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              controller: controller,
            ),),
          SizedBox(
            width: 5.r,
          ),
          Container(
            height: 40.r,
            width: 40.r,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.8),
              borderRadius: BorderRadius.circular(45.r),

            ),
            child: Center(
              child: Icon(Icons.arrow_forward, color: Colors.white,size: 25.r,),
            ),
          ),
          SizedBox(
            width: 5.r,
          )
        ],
      ),
    );
  }

  Widget _widgetListCartItem(){
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
  }){
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          color: Colors.blue.withOpacity(0.05)
      ),
      padding: EdgeInsets.all(12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.r,
            width: 100.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
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
            child: SizedBox(
              height: 100.r,
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tên đại lý: Cửa hàng Quốc tiến",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "Địa điểm: Ngã tư cầu vượt Hòa cầm",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "Link map: link.acp562.GG",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 12.sp,
                    ),
                  ),
                  Container(
                    height: 30.r,
                    width: 90.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.blue
                    ),
                    child: Center(
                      child: Text(
                        "Đặt lịch",
                        style: StylesText.body5.copyWith(color: Colors.white,),
                      ),
                    ),
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
