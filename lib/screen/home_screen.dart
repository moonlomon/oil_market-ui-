import 'package:flutter/material.dart';
import 'package:oil_market/component/main_calenedar.dart';
import 'package:oil_market/component/schedule_bottom_sheet.dart';
import 'package:oil_market/component/schedule_card.dart';
import 'package:oil_market/component/today_banner.dart';
import 'package:oil_market/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(),
            isScrollControlled: true,
          );
        },
        backgroundColor: PrimaryColor,
        child: Icon(Icons.add, color: Colors.white,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(selectedDate: selectedDate, onDaySelected: onDaySelected,),
            SizedBox(height: 8.0),
            TodayBanner(selectedDate: selectedDate, count: 10),
            SizedBox(height: 8.0),
            ScheduleCard(startTime: 12,endTime: 14,content: 'test'),
          ],
        ),
      ),
    );
  }
}
