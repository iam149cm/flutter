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
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// DRY - Do not Repeate Yourself!
class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveCardColor) {
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inactiveCardColor) {
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

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
                      updateColour(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,
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
                      updateColour(Gender.female);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColour,
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
