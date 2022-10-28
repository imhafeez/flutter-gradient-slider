import 'package:flutter/material.dart';
import 'package:gradient_slider/gradient_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textcontroller = TextEditingController();
  double sliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Slider'),
      ),
      body: Column(
        children: [
          GradientSlider(
            thumbAsset: 'assets/vert_thumb.png',
            thumbHeight: 30,
            thumbWidth: 30,
            trackHeight: 10,
            trackBorder: 1,
            activeTrackGradient:
                const LinearGradient(colors: [Colors.blue, Colors.pink]),
            inactiveTrackGradient:
                LinearGradient(colors: [Colors.grey, Colors.grey.shade800]),
            inactiveTrackColor: Colors.black,
            slider: Slider(
                value: sliderValue,
                min: 0,
                max: 10,
                onChanged: (val) {
                  setState(() {
                    sliderValue = val;
                  });
                }),
          ),
          TextField(
            controller: textcontroller,
            keyboardType: TextInputType.number,
            maxLength: 2,
          ),
          ElevatedButton(
              onPressed: () {
                double val = double.parse(textcontroller.text);
                if (val >= 0 && val <= 10) {
                  setState(() {
                    sliderValue = val;
                  });
                }
              },
              child: const Text('change value'))
        ],
      ),
    );
  }
}
