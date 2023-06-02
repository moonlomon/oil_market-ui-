import 'package:flutter/material.dart';
import 'package:oil_market/const/colors.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.startTime, required this.endTime, required this.content}) : super(key: key);

  final int startTime;
  final int endTime;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: PrimaryColor
        ),
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Time(startTime: startTime, endTime: endTime),
            SizedBox(width: 16.0,),
            _Content(content: content),
          ],
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({Key? key, required this.startTime, required this.endTime}) : super(key: key);

  final int startTime;
  final int endTime;

  @override
  Widget build(BuildContext context) {

    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PrimaryColor,
      fontSize: 16.0
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          '${endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(
            fontSize: 10.0
          ),
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
    );
  }
}
