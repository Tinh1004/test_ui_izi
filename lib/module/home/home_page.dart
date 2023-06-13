import 'package:flutter/material.dart';
import 'package:test_internship_enlab/module/home/widget/card_event.dart';
import 'package:test_internship_enlab/module/home/widget/card_voucher.dart';
import 'package:test_internship_enlab/module/list/list_page.dart';
import 'package:test_internship_enlab/module/notify/notify_page.dart';
import 'package:test_internship_enlab/themes/app_dimension.dart';
import 'package:test_internship_enlab/themes/styles_text.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: _widgetAppBar(),
      body: _widgetBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _widgetBottomBar(),
    ));
  }

  Widget _widgetBottomBar() {
    return ValueListenableBuilder(
      valueListenable: currentIndexNotifier,
      builder: (context, value, child) {
        return BottomAppBar(
          notchMargin: 10,
          child: Container(
            height: 60.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _wigetItemBottomBar(
                      title: "Trang chủ",
                      currentIndex: value,
                      index: 0,
                      IconData: Icons.home,
                    ),
                    _wigetItemBottomBar(
                      title: "My Motor",
                      currentIndex: value,
                      index: 1,
                      IconData: Icons.key,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _wigetItemBottomBar(
                      title: "Điểm",
                      currentIndex: value,
                      index: 2,
                      IconData: Icons.star,
                    ),
                    _wigetItemBottomBar(
                      title: "My Moto",
                      currentIndex: value,
                      index: 3,
                      IconData: Icons.chat_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _wigetItemBottomBar({
    required String title,
    required IconData,
    required int index,
    required int currentIndex,
  }) {
    return MaterialButton(
      onPressed: () {
        currentIndexNotifier.value = index;
      },
      minWidth: 40.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconData,
            color: index == currentIndex ? Colors.blue : Colors.grey,
          ),
          SizedBox(
            height: 5.r,
          ),
          Text(
            title,
            style: TextStyle(
              color: index == currentIndex ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _widgetAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Row(
        children: [
          SizedBox(
            width: 10.r,
          ),
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(color: Colors.grey, width: 1.r)),
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 30.r,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      title: Center(
        child: Text(
          "My motor",
          style: StylesText.header3.copyWith(color: Colors.black),
        ),
      ),
      actions: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotifyPage(),
                  ),
                );
              },
              child: Container(
                width: 40.r,
                height: 40.r,
                margin: EdgeInsets.only(top: 10.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    border: Border.all(color: Colors.grey, width: 1.r)),
                child: Center(
                  child: Icon(
                    Icons.add_alert_outlined,
                    size: 30.r,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.r,
        ),
      ],
    );
  }

  Widget _widgetBody() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.r, right: 10.r, top: 6.r, bottom: 8.r),
        child: Column(
          children: [
            _widgetTopBody(),
            SizedBox(
              height: 10.h,
            ),
            _widgetCardSlider(),
            SizedBox(
              height: 20.h,
            ),
            _widgetListVoucher(),
            SizedBox(
              height: 20.h,
            ),
            _widgetListEvents(),
          ],
        ),
      ),
    );
  }

  Widget _widgetTopBody() {
    return Row(
      children: [
        Container(
          height: 30.r,
          width: 30.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colors.blue, width: 1.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(1, 4), // changes position of shadow
                ),
              ]),
          child: Center(
            child: Icon(
              Icons.sticky_note_2_outlined,
              size: 25.r,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          height: 30.r,
          padding: EdgeInsets.only(left: 5.r, right: 5.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colors.blue, width: 1.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(1, 4),
                ),
              ]),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.sticky_note_2_outlined,
                  size: 25.r,
                  color: Colors.blue,
                ),
                Text("0 điểm")
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetCardSlider() {
    return Container(
      height: 250.h,
      width: 1.sw,
      decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: NetworkImage("https://media.hanamtv.vn/upload/image/202203/medium/73653_32bed7ac7afd97cecd6e352b88d823fa.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _widgetListVoucher() {
    return Column(
      children: [
        _widgetTitleList(title: "Voucher"),
        SizedBox(
          height: 10.r,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardVoucher(),
            SizedBox(
              width: 15.r,
            ),
            CardVoucher(),
          ],
        ),
      ],
    );
  }

  Widget _widgetListEvents() {
    return Column(
      children: [
        _widgetTitleList(title: "Sự kiện & Khuyến mãi"),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 190,
          width: 1.sw,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardEvent(),
              CardEvent(),
              CardEvent(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _widgetTitleList({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: StylesText.header2.copyWith(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(),),);
          },
          child: Text(
            "Xem thêm >",
            style: StylesText.body3.copyWith(
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ],
    );
  }
}
