import 'package:bloc_example/bloc_builder/bloc_builder_widget.dart';
import 'package:flutter/material.dart';
import 'bloc_builder/bloc_selector_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title:"Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onBlockBuilder() {
    Navigator.push(
      context,
        MaterialPageRoute(builder: (context)=>const BlocBuilderWidget())
    );

  }
  void _onBlockSelector() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>const BlocSelectorWidget())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _onBlockBuilder,
                  child: const Icon(Icons.build),
                ),
                const SizedBox(width: 40,),
                const Text("BlocBuilder Screen")
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _onBlockSelector,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 40,),
                const Text("BlocSelector Screen")
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
