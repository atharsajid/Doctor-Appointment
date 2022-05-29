import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime dateTime = DateTime(2022, 05, 30, 5, 30);
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Text(
            'Create new Schedule for appointment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("Date"),
          ElevatedButton(
            onPressed: () async {
              final date = await pickDate();
              if (date == null) return;
              final newDateTime = DateTime(date.year, date.month, date.day,
                  dateTime.hour, dateTime.minute);
              setState(() {
                dateTime = newDateTime;
              });
            },
            child: Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
          ),
          const Text('Time'),
          ElevatedButton(
            onPressed: () async {
              final time = await pickTime();
              if (time == null) return;
              final newDateTime = DateTime(
                dateTime.year,
                dateTime.month,
                dateTime.day,
                time.hour,
                time.minute,
              );
              setState(() {
                dateTime = newDateTime;
              });
            },
            child: Text('$hours:$minutes'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.amber),
            onPressed: () {},
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
