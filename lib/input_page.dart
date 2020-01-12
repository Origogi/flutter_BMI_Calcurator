import 'package:flutter/material.dart';
import 'package:flutter_bmi_calcurator/resuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  //1 = male, 2 = female
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCURAOTR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('male card was pressed');
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReuseableCard(
                      color: maleCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  )),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('female card was pressed');
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReuseableCard(
                        color: femaleCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          text: "FEMALE",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ReuseableCard(
              color: activeCardColor,
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReuseableCard(color: activeCardColor)),
                  Expanded(child: ReuseableCard(color: activeCardColor)),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
