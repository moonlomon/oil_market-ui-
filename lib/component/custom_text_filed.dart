import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oil_market/const/colors.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({Key? key, required this.label, required this.isTime}) : super(key: key);

  final String label;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: PrimaryColor,
                fontWeight: FontWeight.w600
            ),
          ),
          Expanded(
            flex: isTime ? 0 : 1,
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLines: isTime ? 1 : null,
              expands: !isTime,
              keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
              inputFormatters: isTime? [
                FilteringTextInputFormatter.digitsOnly,
              ] : [],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[300],
                suffixText: isTime ? '시' : null
              ),
            )
          )
        ],
      ),
    );
  }
}
