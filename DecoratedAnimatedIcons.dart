import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppWidget());
}

class DataClass {
  static List<GlobalKey> keyList = <GlobalKey>[];

  static GlobalKey getKey() {
    GlobalKey newKey = GlobalKey();
    keyList.add(newKey);
    return newKey;
  }
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DataClass.keyList.clear();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMainScreen(),
    );
  }
}

class MyMainScreen extends StatelessWidget {
  const MyMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('AnimatedIcom Example')),
        actions: [
          ContainedAnimatedIcon(child: AnimateIcons.add),
          ContainedAnimatedIcon(
            child: AnimateIcons.map,
          ),
          ContainedAnimatedIcon(child: AnimateIcons.activity)
        ],
      ),
      body: Center(child: ContainedAnimatedIcon(child: AnimateIcons.print)),
    );
  }
}

BoxDecoration myDecoration() {
  return BoxDecoration(
      color: const Color.fromARGB(86, 18, 218, 197),
      border: Border.all(
        width: 2,
        color: Colors.blueAccent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)));
}

class ContainedAnimatedIcon extends StatelessWidget {
  ContainedAnimatedIcon({Key? key, required this.child})
      : super(key: DataClass.getKey());
  final AnimateIcons child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: myDecoration(),
        child: AnimateIcon(
          onTap: () {
            int myIndex =
                DataClass.keyList.indexWhere((element) => element == key);
            print(myIndex);
            print(
                DataClass.keyList[myIndex].currentContext!.widget.runtimeType);

            // print('${key}');
            // print('length=${DataClass.keyList.length}');
            // DataClass.keyList.forEach((element) {
            //   print('$element');
            // });
          },
          iconType: IconType.animatedOnHover,
          animateIcon: child,
          height: 50,
          width: 50,
          color: Colors.blue[600]!,
          toolTip: 'Print',
        ),
      ),
    );
  }
}
