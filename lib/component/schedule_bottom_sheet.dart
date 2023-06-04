import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oil_market/component/custom_text_filed.dart';
import 'package:oil_market/const/colors.dart';
import 'package:oil_market/database/drift_database.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey(); // textFormField 일괄조작을 위한 필수키

  int? startTime;
  int? endTime;
  String? content;

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      await GetIt.I<LocalDatabase>().createSchedule(
        SchedulesCompanion(
          startTime: Value(startTime!),
          endTime: Value(endTime!),
          content: Value(content!),
          date: Value(widget.selectedDate),
        ),
      );

      Navigator.of(context).pop();
      // print(startTime);
      // print(endTime);
      // print(content);
    }
  }

  String? timevalidator (String? val){
    if (val == null) {
      return '값을 입력해주세요';
    }

    int? num;

    try {
      num = int.parse(val);
    } catch (e) {
      return '숫자를 입력해주세요';
    }

    if (num < 0 || num > 24){
      return '0시부터 24시까지의 값을 입력해주세요';
    }

    return null;
  }

  String? contentvalidator (String? val){
    if (val == null || val.isEmpty) {
      return '값을 입력해주세요';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFeild(
                        label: '시작시간',
                        isTime: true,
                        onSaved: (String? val) {
                          startTime = int.parse(val!);
                        },
                        validator: timevalidator,
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: CustomTextFeild(
                        label: '종료시간',
                        isTime: true,
                        onSaved: (String? val){
                          endTime = int.parse(val!);
                        },
                        validator: timevalidator,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8.0,),
                Expanded(
                  child: CustomTextFeild(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      content = val;
                    },
                    validator: contentvalidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('저장', style: TextStyle(color: Colors.white),),
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
