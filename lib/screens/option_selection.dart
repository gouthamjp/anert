import 'package:anert/constants.dart';
import 'package:anert/utils/stepper_counter.dart';
import 'package:flutter/material.dart';
import 'package:anert/utils/button.dart';

enum Option {
  inspect,
  ev,
}
class OptionSelection extends StatefulWidget {
  const OptionSelection({ Key? key }) : super(key: key);

  @override
  _OptionSelectionState createState() => _OptionSelectionState();
}

class _OptionSelectionState extends State<OptionSelection> {
  Option optionSelect=Option.inspect;
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mquery.height,
        width: mquery.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepperCounter(maxCount: 3,currentElement: 1,),
            Container(
              margin: const EdgeInsets.all(18),
              child: Row(
                children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress:  () {
                    setState(() {
                      optionSelect = Option.inspect;
                    });
                  },
                  colour: optionSelect == Option.inspect? GreenTvmTheme.secondaryGray: Colors.white,
                  cardChild: Text('SITE FOR INSPECTION'),)
                ),
                SizedBox(width: 30,),
                Expanded(
                  child: ReusableCard(
                    onPress:  () {
                    setState(() {
                      optionSelect = Option.ev;
                    });
                  },
                  colour: optionSelect == Option.ev? GreenTvmTheme.secondaryGray: Colors.white,
                  cardChild: Text('SITE FOR EV'),)
                ),
                ],
              )
            ),
            Button(onpress: (){
              print('hello3');
            },
             text: 'NEXT')
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(color: GreenTvmTheme.secondaryGray,borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),),
        
      ),
    );
  }
}
