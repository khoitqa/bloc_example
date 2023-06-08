import 'package:bloc_example/bloc_builder/bloc_builder_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_builder/bloc_selector_widget.dart';

void main()async {
  // await ScreenUtil.ensureScreenSize();
  runApp( DevicePreview(enabled: kDebugMode && kIsWeb,builder: (context){
    return const MyApp();
  },));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        useInheritedMediaQuery: false,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title:"Home Page"),
        );
      }
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
                 Text("BlocBuilder Screen",style: TextStyle(fontSize: 12.sp),)
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
                 const Text("BlocSelector Screen",style: TextStyle(fontSize: 20))
              ],
            ),
            Container(
              color: Colors.blue,
              constraints: BoxConstraints(maxWidth: 180, minHeight: 200).hw,
              padding: EdgeInsets.all(10.w),
              child: Text(
                'My design draft width: 180dp\n\n'
                    'My design draft height: 200dp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(12),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
