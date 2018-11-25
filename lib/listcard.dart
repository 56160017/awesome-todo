import 'package:flutter/material.dart';
import 'package:flutter_homework/listmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Listcard extends StatefulWidget {
  Listcard(this.list);

  final Listmodel list;

  @override
  _MyListcardState createState() => _MyListcardState();
}

class _MyListcardState extends State<Listcard> {
  bool checkboxValueA = false;
  TextDecoration textDecoration = TextDecoration.none;

  @override
  void initState() {
    super.initState();
  }

  bool composeCheckbox(bool value) {
    setState(() {
      checkboxValueA = value;
      checkboxValueA
          ? textDecoration = TextDecoration.lineThrough
          : textDecoration = TextDecoration.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    child: SizedBox(
                      width: 300,
                      child: RichText(
                        text: new TextSpan(
                          text: 'This item costs ',
                          children: <TextSpan>[
                            new TextSpan(
                              text: widget.list.title,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                decoration: textDecoration,
                              ),
                            ),
                            TextSpan(
                              text: widget.list.title,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Checkbox(value: checkboxValueA, onChanged: composeCheckbox),
                ]),
          ),
        ],
      ),
    );
  }
}
