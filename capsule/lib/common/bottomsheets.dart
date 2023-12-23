import 'package:flutter/material.dart';

import '../constants.dart';

loadingBottomSheetWrapper(loadingText){
return FractionallySizedBox(
    heightFactor: 0.4,
    child: Container(
        height: 500,
        color: Colors.black87,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              child: Divider(
                thickness: 3.0,
                height: 20,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height:
                30.0, // Adjust the height of the circular progress indicator
            width: 30.0, // Adjust the width of the circular progress indicator
            child: CircularProgressIndicator(
              strokeWidth:
                  5.0, // Adjust the width of the circular progress indicator's stroke
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              loadingText,
              style: whitetextStyle,
            ),
          ),
        ])));
}

successBottomSheetWrapper(successtext){
return FractionallySizedBox(
    heightFactor: 0.4,
    child: Container(
        height: 500,
        color: Colors.black87,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              child: Divider(
                thickness: 3.0,
                height: 20,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(Icons.check_circle, color: Colors.blueAccent, size: 48.0),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              successtext,
              style: whitetextStyle,
            ),
          ),
        ])));
}
