import 'package:flutter/material.dart';

import 'page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Deze houdt je state bij
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState(); // root
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('second page'),
         
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            debugPrint("Switching to page 1");
            Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context){
              return const Page1();
            }));
          },

          child: const Text('Page 1'),
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
  }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
  
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('second page'),
        // title: Text(widget.title),
      ),
      body: Center(
      
        child: ElevatedButton(onPressed: (){}, child: const Text('page 1'),)
       ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
