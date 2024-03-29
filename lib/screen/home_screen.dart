import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oil_market/component/main_calenedar.dart';
import 'package:oil_market/component/schedule_bottom_sheet.dart';
import 'package:oil_market/component/schedule_card.dart';
import 'package:oil_market/component/today_banner.dart';
import 'package:oil_market/const/colors.dart';

import '../database/drift_database.dart';

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
            builder: (_) => ScheduleBottomSheet(selectedDate: selectedDate,),
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
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                return TodayBanner(
                    selectedDate: selectedDate,
                    count: snapshot.data?.length ?? 0 // 값이 null이거나 길이가 null일 경우 0을 사용한다
                );
              },
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: StreamBuilder<List<Schedule>>(
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Container();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      final schedule = snapshot.data![index];
                      return Dismissible(
                        key: ObjectKey(schedule.id),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (direction) => {
                          GetIt.I<LocalDatabase>().removeSchedule(schedule.id)
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:8.0, left:8.0, right:8.0),
                          child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
