import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data as SharedPreferences;
          final date = prefs.getString('bmi_date');
          final data = prefs.getStringList('bmi_data');
          return Center(
            child: InfoCard(
              width: _deviceWidth! * 0.75,
              height: _deviceHeight! * 0.25,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _statusText(data![1]),
                  _dateText(date!),
                  _bmiText(data[0]),
                ],
              ),
            ),
          );
          ;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _statusText(String _status) {
    return Text(
      _status,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _dateText(String _date) {
    DateTime _parseDate = DateTime.parse(_date);
    return Text(
      '${_parseDate.day} / ${_parseDate.month} / ${_parseDate.year}',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _bmiText(String _bmi) {
    return Text(
      double.parse(_bmi).toStringAsFixed(2),
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
