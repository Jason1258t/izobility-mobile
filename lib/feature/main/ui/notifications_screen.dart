import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("notes")),
      body: CustomScrollView(
        slivers: [
          getWidgets(Colors.red),
          getWidgets(Colors.blue),
          getWidgets(Colors.purple)
        ],
      ),
    ));
  }

  Widget getWidgets(Color color) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(
            child: Container(
                height: 40,
                color: Colors.amber,
                child: Text(
                  'fuck ${color.toString()}',
                ))),
        SliverList.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) => Container(
                  height: 40,
                  color: color,
                  child: Text(index.toString()),
                )),
      ],
    );
  }
}

final notification = {
  'date': DateTime.now(),
  'type': '/transaction type',
  'data': {
    'name': 'super 228 game',
    'price': '11', // OPTIONAL
    'description': 'really super mega game',
  }
};
