import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderOP extends StatefulWidget {
  const StreamBuilderOP({super.key});

  @override
  State<StreamBuilderOP> createState() => _StreamBuilderOPState();
}

class _StreamBuilderOPState extends State<StreamBuilderOP> {
  int counter = 0;
  StreamController<int> counterController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Strem Builder"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
                stream: counterController.stream,
                builder: (context, Snapshot) {
                  if (Snapshot.hasData) {
                    return Text(Snapshot.data.toString());
                  } else {
                    return Text("0");
                  }
                }),
            FloatingActionButton(
              onPressed: () {
                counter++;
                counterController.sink.add(counter);
              },
              child: Text("Counter Inc"),
            )
          ],
        ),
      ),
    );
  }
}
