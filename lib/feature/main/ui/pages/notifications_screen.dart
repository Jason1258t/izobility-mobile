import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: AppBar(title: Text("notes")),
      body: CustomScrollView(
    slivers: [
      getWidgets(Colors.red),
      getWidgets(Colors.blue),
      getWidgets(Colors.purple)
    ],
      ),
    );
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
  'date_interval_start': DateTime.now(),
  'date_interval_end': DateTime.now(),
  'data': [
    {
      'date': DateTime.now(), // requried (group of notifications by day)
      'notifications': [
        {
          'type': 'SEND/GET/BUY/SELL', // required
          'label': 'oaoaoa', // required
          'time': DateTime.now(), // required
          'description': 'hahahah',
          'coin_type': 'BEBRA',
          'price': '2000',
        },
        {
          'type': 'SEND/GET/BUY/SELL', // required
          'label': 'oaoaoa', // required
          'time': DateTime.now(), // required
          'description': 'hahahah',
          'coin_type': 'BEBRA',
          'price': '2000',
        },
      ]
    },
    {
      'date': DateTime.now(), // requried (group of notifications by day)
      'notifications': [
        {
          'type': 'SEND/GET/BUY/SELL', // required
          'label': 'oaoaoa', // required
          'time': DateTime.now(), // required
          'description': 'hahahah',
          'coin_type': 'BEBRA',
          'price': '2000',
        },
        {
          'type': 'SEND/GET/BUY/SELL', // required
          'label': 'oaoaoa', // required
          'time': DateTime.now(), // required
          'description': 'hahahah',
          'coin_type': 'BEBRA',
          'price': '2000',
        },
      ]
    }
  ]
};
