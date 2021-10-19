import 'package:anert/constants.dart';
import 'package:anert/screens/form_screens/ev_site.dart';
import 'package:anert/screens/form_screens/inspection_site.dart';
import 'package:anert/screens/form_screens/name_of_institution_screen.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';
import 'package:provider/provider.dart';
import 'package:anert/providers/form_provider.dart';

class OptionSelection extends StatefulWidget {
  static String id = 'option_screen';

  @override
  _OptionSelectionState createState() => _OptionSelectionState();
}

class _OptionSelectionState extends State<OptionSelection> {
  Option optionSelect = Option.solar;
  @override
  Widget build(BuildContext context) {
    final detData = Provider.of<FormProvider>(context);
    final mquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GreenTvmTheme.themeAppbar(
          title: 'GREEN TVM', context: context, showBackButton: false),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mquery.height,
        width: mquery.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StepperCounter(
              maxCount: 3,
              currentElement: 1,
            ),
            Container(
                margin: const EdgeInsets.all(18),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                      onPress: () {
                        setState(() {
                          optionSelect = Option.solar;
                        });
                      },
                      colour: optionSelect == Option.solar
                          ? GreenTvmTheme.secondaryGray
                          : Colors.white,
                      cardChild: Text(
                        'SITE FOR \nINSPECTION',
                        textAlign: TextAlign.center,
                        style: GreenTvmTheme.optionStyle,
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            optionSelect = Option.ev;
                          });
                        },
                        colour: optionSelect == Option.ev
                            ? GreenTvmTheme.secondaryGray
                            : Colors.white,
                        cardChild: Text(
                          'SITE FOR \nEV',
                          textAlign: TextAlign.center,
                          style: GreenTvmTheme.optionStyle,
                        ),
                      ),
                    )
                  ],
                )),
            Button(
                onpress: () {
                  if (optionSelect == Option.solar) {
                    detData.formType = 0;
                  } else {
                    detData.formType = 1;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NameOfInstitution(
                                option: optionSelect,
                              )));
                },
                text: 'NEXT')
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: GreenTvmTheme.secondaryGray,
            )),
      ),
    );
  }
}
