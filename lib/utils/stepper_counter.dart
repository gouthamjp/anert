import 'package:flutter/material.dart';
import '/constants.dart';

class StepperCounter extends StatelessWidget {

  final int currentElement;
  final int maxCount;
  const StepperCounter({
    required this.currentElement,
    required this.maxCount
  });


  Widget _buildCounterView() {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        for(int element = 1; element <= maxCount; element++)
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only( 
              left: 10,
              right: 10,
            ),
            child: _buildCounterElement(element)
          )
      ]
    );
  }

  Widget _buildCounterElement(int element) {
    if(element < currentElement) {
      return _buildCompletedCounterElement(element);
    }else if(element == currentElement) {
      return _buildCurrentCounterElement(element);
    }else {
      return _inCompleteCounterElement(element);
    }
  }

  Widget _inCompleteCounterElement(int element) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: GreenTvmTheme.secondaryGray),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        '$element',
        style: const TextStyle(
          fontFamily: GreenTvmTheme.fontSemiBold,
          color: GreenTvmTheme.secondaryGray,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildCompletedCounterElement(int element) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: GreenTvmTheme.primaryBlue),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        '$element',
        style: const TextStyle(
          fontFamily: GreenTvmTheme.fontSemiBold,
          color: GreenTvmTheme.primaryBlue,
          fontSize: 12,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }

  Widget _buildCurrentCounterElement(int element) {
    return Container(
      decoration: BoxDecoration(
        color: GreenTvmTheme.primaryBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: Text(
        '$element',
        style: const TextStyle(
          fontFamily: GreenTvmTheme.fontSemiBold,
          fontWeight: FontWeight.w600,
          color: Colors.white ,
          fontSize: 12,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final mquery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0), 
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: mquery.width*0.4, vertical: 8),
            child: Divider(
              color: GreenTvmTheme.secondaryGray,
              thickness: 2,
            ),
          ),
          _buildCounterView()
        ],
      )
    );
  }
}