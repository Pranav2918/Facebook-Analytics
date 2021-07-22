import 'package:facebook_analytics/facebook_analytics.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

class FacebookAnalyticsApp extends StatelessWidget {
  final facebookAnalytics = FacebookAnalytics();
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
                  facebookAnalytics.logEvent(name: 'Button Clicked');
                }),
          ),
          Center(
            child: RaisedButton(
                child: Text('Test2'),
                onPressed: () {
                  facebookAnalytics.logEvent(name: 'Tapped');
                }),
          ),
        ],
      ),
    ));
  }
}
