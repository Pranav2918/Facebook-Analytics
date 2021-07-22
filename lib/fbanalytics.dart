import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

class FacebookAnalyticsApp extends StatelessWidget {
  static final facebookAppEvents = FacebookAppEvents();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: facebookAppEvents.getAnonymousId(),
            builder: (context, snapshot) {
              final id = snapshot.data ?? '???';
              return Text('Anonymous ID: $id');
            },
          ),
          Center(
            child: RaisedButton(
                child: Text('Test'),
                onPressed: () {
                  facebookAppEvents.logEvent(name: 'Event 1 tapped');
                }),
          ),
          Center(
            child: RaisedButton(
                child: Text('Test2'),
                onPressed: () {
                  facebookAppEvents.logEvent(name: 'Event 2 tapped');
                }),
          ),
          Center(
            child: RaisedButton(
                child: Text('Test3'),
                onPressed: () {
                  facebookAppEvents.logEvent(name: 'Without Analytics');
                }),
          ),
        ],
      ),
    ));
  }
}
