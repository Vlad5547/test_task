import 'package:flutter/material.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:intl/intl.dart';
import 'package:test_task_screen/layers/presentation/app_style.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        title: const Align(alignment: Alignment.centerRight ,child: Text('Calendar')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PagedVerticalCalendar(
          minDate: DateTime.now().subtract(const Duration(days: 365)),
          maxDate: DateTime.now().add(const Duration(days: 365)),
          initialDate: DateTime.now(),
          dayBuilder: (context, date) {
            bool isToday = DateFormat('yyyy-MM-dd').format(date) == DateFormat('yyyy-MM-dd').format(DateTime.now());
            return Container(
              alignment: Alignment.center,
              decoration: isToday ? BoxDecoration(
                color: Colors.orange.withOpacity(0.25),
                shape: BoxShape.circle,
              ) : null,
              child: Text(
                DateFormat('d').format(date),
                style: AppStyle.textDayStyle,
              ),
            );
          },
          monthBuilder: (context, month, year) {
            return Container(

              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('yyyy').format(DateTime(year)),
                    style: AppStyle.textYearStyle
                  ),
                  Text(
                    DateFormat('MMMM').format(DateTime(month)),
                    style: AppStyle.textMonthStyle
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
