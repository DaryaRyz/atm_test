import 'package:atm_test/domain/models/event.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_events/event_card.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
class AtmEvents extends StatelessWidget {
  final List<Event> eventList;

  const AtmEvents({
    Key? key,
    required this.eventList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.atmEventTitle,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          for (var element in eventList)
            EventCard(
              title: element.title,
              extraInfo: element.extraInfo,
              time: element.time,
              onTap: () {
                Logger().i('Pressing the EventCard');
              },
            ),
          CustomButton(
            backgroundColor: Colors.transparent,
            onTap: () {
              Logger().i('Pressing the button "Show all events"');
            },
            height: 32,
            width: double.maxFinite,
            text: Strings.atmEventButtonTitle,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
