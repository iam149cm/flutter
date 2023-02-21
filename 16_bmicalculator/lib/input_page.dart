import 'package:bmicalculator/icon_content.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

// 🤍 ENUM - Enumeration 열거 (The action of establishing the number of something)
// 대문자로 시작하고 camel case
enum Gender {
  none,
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// DRY - Do not Repeate Yourself!
class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      label: 'MALE',
                      icon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: Container(
                        child: IconContent(
                      label: 'FEMALE',
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Container(child: null),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Container(child: null),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Container(child: null),
                ),
              ),
            ]),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(
              top: 10,
            ),
            width: double.infinity, // 가로의 full-width
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
