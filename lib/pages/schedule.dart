import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_project/data.dart';
import 'package:go_router/go_router.dart';

class Schedule extends StatelessWidget {
  Schedule({super.key});

  final _calendarControllerToday = AdvancedCalendarController.today();

  final _calendarControllerCustom =
      AdvancedCalendarController(DateTime(2022, 10, 23));

  final events = <DateTime>[
    DateTime.now(),
    DateTime(2022, 10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // darkTheme: ThemeData.dark(),
      appBar: AppBar(
        title: const Text('Schedule'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            return context.pop();
          },
        ),
      ),
      body: Builder(builder: (context) {
        final theme = Theme.of(context);

        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdvancedCalendar(
              showNavigationArrows: true,
              controller: _calendarControllerToday,
              events: events,
              startWeekDay: 1,
            ),
            // Theme(
            //   data: theme.copyWith(
            //     textTheme: theme.textTheme.copyWith(
            //       titleMedium: theme.textTheme.titleMedium!.copyWith(
            //         fontSize: 16,
            //         color: theme.colorScheme.secondary,
            //       ),
            //       bodyLarge: theme.textTheme.bodyLarge!.copyWith(
            //         fontSize: 14,
            //         color: Colors.black54,
            //       ),
            //       bodyMedium: theme.textTheme.bodyMedium!.copyWith(
            //         fontSize: 12,
            //         color: Colors.black87,
            //       ),
            //     ),
            //     primaryColor: Colors.red,
            //     highlightColor: Colors.yellow,
            //     disabledColor: Colors.green,
            //   ),
            //   child: AdvancedCalendar(
            //     controller: _calendarControllerCustom,
            //     events: events,
            //     weekLineHeight: 48.0,
            //     startWeekDay: 1,
            //     innerDot: true,
            //     keepLineSize: true,
            //     calendarTextStyle: const TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400,
            //       height: 1.3125,
            //       letterSpacing: 0,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Best Destination',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextButton(
                    child: const Text('View all',
                        style: TextStyle(
                            color: Color.fromARGB(255, 4, 94, 249),
                            fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(destinations[index].toString()),
                    subtitle: Text('Destination ${index + 1} \n location'),
                    leading: Image.network(
                      'https://images.pexels.com/photos/29768361/pexels-photo-29768361/free-photo-of-stylish-woman-in-urban-setting-with-motion-blur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle destination tap
                      print('Tapped on ${destinations[index]}');
                    },
                  ),
                );
              },
            ))
          ],
        );
      }),
    );
  }
}
