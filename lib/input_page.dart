import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'reusable_card.dart';
import 'binary_icons.dart';
import 'constants.dart';

enum Temperature {
  fahrenheit,
  celsius,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Temperature selectedTemperature;
  String tempType;
  String conversionType;
  double inputTemperature;
  double convertedTemperature;
  int tipPercentage = 20;
  double billAmount;
  double tip;
  double total;
  final _temperatureController = TextEditingController();
  final _tipController = TextEditingController();

  void convertTemp() {
    inputTemperature = double.parse(_temperatureController.text);
    print(inputTemperature);
    selectedTemperature == Temperature.celsius
        ? tempType = 'Celsius'
        : tempType = 'Fahrenheit';
    selectedTemperature == Temperature.celsius
        ? conversionType = 'Fahrenheit'
        : conversionType = 'Celsius';
    selectedTemperature == Temperature.celsius
        ? convertToFahrenheit()
        : convertToCelsius();
  }

  void convertToFahrenheit() {
    //Multiply by 9, then divide by 5, then add 32
    convertedTemperature = ((inputTemperature * 9) / 5) + 32;
    print(convertedTemperature);
  }

  void convertToCelsius() {
    // Deduct 32, then multiply by 5, then divide by 9
    convertedTemperature = ((inputTemperature - 32)*5)/9;
    print(convertedTemperature);
  }

  void calculatePercentage() {
    billAmount = double.parse(_tipController.text);
    tip = tipPercentage.toDouble() / 100.0;
    tip = tip * billAmount;
    total = billAmount + tip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text('QUICK CALCULATOR')),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedTemperature = Temperature.celsius;
                        });
                      },
                      colorProp: selectedTemperature == Temperature.celsius
                          ? kDefaultCardColor
                          : kInactiveCardColor,
                      cardChild: BinaryWidget(
                        iconType: WeatherIcons.celsius,
                        title: 'Celsius',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedTemperature = Temperature.fahrenheit;
                        });
                      },
                      colorProp: selectedTemperature == Temperature.fahrenheit
                          ? kDefaultCardColor
                          : kInactiveCardColor,
                      cardChild: BinaryWidget(
                        iconType: WeatherIcons.fahrenheit,
                        title: 'Celsius',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: ReusableCard(
                        colorProp: kDefaultCardColor,
                        cardChild: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
//                            icon: Icon(WeatherIcons.day_snow),
                            labelText: 'Temperature:',
                            hintText: 'Temperature:',
                            border: OutlineInputBorder(),
                          ),
                          controller: _temperatureController,
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          convertTemp();
                        });
                      },
                      colorProp: kDefaultCardColor,
                      cardChild: Center(
                        child: Text(
                          '$inputTemperature $tempType = $convertedTemperature $conversionType',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Expanded(
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: ReusableCard(
                        colorProp: kDefaultCardColor,
                        cardChild: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                          decoration: const InputDecoration(
//                            icon: Icon(WeatherIcons.day_snow),
                            labelText: 'Bill Amount:',
                            hintText: 'Bill Amount:',
                            border: OutlineInputBorder(),
                          ),
                          controller: _tipController,
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              child: ReusableCard(
                colorProp: kDefaultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          tipPercentage.toString(),
                          style: kBigDickTextStyle,
                        ),
                        Text(
                          '%',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: tipPercentage.toDouble(),
                      min: 0.0,
                      max: 100.0,
                      onChanged: (double newValue) {
                        setState(() {
                          tipPercentage = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          calculatePercentage();
                        });
                      },
                      colorProp: kDefaultCardColor,
                      cardChild: Center(
                        child: Text(
                          '$tipPercentage of $billAmount: \n Tip = $tip \n Total = $total',
                        ),
                      )
                    ),
                  ),
                ],
              )
            ),
//            Container(
//              color: kBottomContainerColor,
//              margin: EdgeInsets.only(top: 10.0),
//              width: double.infinity,
//              height: kBottomContainerHeight,
//              child: Center(
//                child: Text(
//                  'Calculate',
//                  style: kButtonTextStyle,
//                ),
//              )
//            )
          ],
        ),
      ),
    );
  }
}