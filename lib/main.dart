import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            MyInheritedWidget(
              color: color,
              child: const ColoredContainer(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: const Text('red'),
                  onPressed: () {
                    color = Colors.red;
                    setState(() {});
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: const Text('green'),
                  onPressed: () {
                    color = Colors.green;
                    setState(() {});
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.pink,
                  child: const Text('pink'),
                  onPressed: () {
                    color = Colors.pink;
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context
            .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
            ?.color ??
        Colors.green;
    return Container(
      color: color,
      height: 300,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key, required Widget child, required this.color})
      : super(key: key, child: child);
  final Color color;
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.color != color;
  }
}
