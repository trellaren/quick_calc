import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        accentColor: Color(0xFF1C2033),
        scaffoldBackgroundColor: Color(0xFF07091B),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xFFFFFFFF),
          inactiveTrackColor: Color(0xFF8D8E98),
          thumbColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}