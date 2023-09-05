import 'package:btms_refee/Widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusTypeButton1 extends StatelessWidget {
  final String value;
  final String title;
  final bool isPass;

  const StatusTypeButton1(
      {super.key,
      required this.value,
      required this.title,
      required this.isPass});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<RadioButtonController>(builder: (radioButtonController) {
      return InkWell(
        onTap: () => radioButtonController.setStatusType1(value),
        child: Row(
          children: [
            Radio(
                value: value,
                groupValue: radioButtonController.statusType1,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (String? value) {
                  // radioButtonController.setStatusType1(value!);
                }),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            // Text('(${(value == 'Đạt' || isPass) ? 'Đạt' : 'Không đạt'})')
          ],
        ),
      );
    });
  }
}
