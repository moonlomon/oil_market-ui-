import 'package:flutter/material.dart';
import 'package:oil_market/const/colors.dart';

class TodayBanner extends StatelessWidget {
  const TodayBanner({Key? key, required this.selectedDate, required this.count}) : super(key: key);

  final DateTime selectedDate;
  final int count;

  @override
  Widget build(BuildContext context) {

    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: PrimaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
            style: textStyle,
          ),
          Text(
            '${count}개',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
