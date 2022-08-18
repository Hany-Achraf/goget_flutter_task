import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navbar_provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int index = Provider.of<BottomNavbarProvider>(context).index;

    return BottomNavigationBar(
      currentIndex: index,
      onTap: (idx) {
        Provider.of<BottomNavbarProvider>(context, listen: false)
            .changeIndex(index: idx);

        if (idx == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        } else {
          Navigator.pushNamed(context, '/time_summary_screen');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time_rounded),
          label: 'Summaries',
        ),
      ],
    );
  }
}
