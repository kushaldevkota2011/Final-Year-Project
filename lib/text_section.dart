import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hPad = 13.0;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
            child: Text(_title, style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, _hPad),
            child: Text(_body,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.justify),
          ),
        ]);
  }
}
