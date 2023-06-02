import 'package:flutter/material.dart';
import 'package:oil_market/component/custom_text_filed.dart';
import 'package:oil_market/const/colors.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
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
                    ),
                  ),
                  SizedBox(width: 8.0,),
                  Expanded(
                    child: CustomTextFeild(
                      label: '종료시간',
                      isTime: true,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.0,),
              Expanded(
                child: CustomTextFeild(
                  label: '내용',
                  isTime: false,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('저장', style: TextStyle(color: Colors.white),),
                  onPressed: (){},
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
    );
  }
}
