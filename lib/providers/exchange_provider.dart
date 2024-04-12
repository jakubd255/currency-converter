import 'package:currency_converter/constants/initial_offline_rates.dart';
import 'package:currency_converter/functions/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../functions/format_number.dart';

class ExchangeProvider extends ChangeNotifier {
    var box = Hive.box("myBox");

    String _value = "0";
    String get value => _value;

    bool _isLoaded = false;
    bool get isLoaded => _isLoaded;

    String _from = "USD";
    String get from => _from;

    String _to = "EUR";
    String get to => _to;

    late Map<String, dynamic> _rates;
    Map<String, dynamic> get rates => _rates;

    late String _date;
    String get date => _date;

    late String _base;
    String get base => _base;

    late bool _isConnected;
    bool get isConnected => _isConnected;

    ExchangeProvider(BuildContext context);

    void initialize(BuildContext context) async {
        _isConnected = await checkConnection();

        if(_isConnected) {
            final response = await Dio().get("https://api.frankfurter.app/latest?from=USD");
            if(response.statusCode == 200) {
                _base = response.data["base"];
                _rates = response.data["rates"];
                _date = response.data["date"];

                box.put("rates", response.data["rates"]);
                box.put("date", response.data["date"]);
            }
        }
        else {
            _base = "USD";
            _rates = box.get("rates", defaultValue: initialOfflineRates);
            _date = box.get("date", defaultValue: initaialOfflineDate);
        }

        _rates[_base] = 1.0;
        _isLoaded = true;

        _from =  box.get("from", defaultValue: "USD");
        _to = box.get("to", defaultValue: "EUR");

        notifyListeners();
    }

    void setValue(String value) {
        _value = value;
        notifyListeners();
    }

    void chooseCurrency(String choice, String currency) {
        if(choice == "from") {
            if(_to == currency) {
                swap();
            }
            else {
                _from = currency;
            }
        }
        else if(choice == "to") {
            if(_from == currency) {
                swap();
            }
            else {
                _to = currency;
            }
        }
        updateCurrecyChoice();
        notifyListeners();
    }

    void updateCurrecyChoice() async {
        await box.put("from", _from);
        await box.put("to", _to);
    }

    void swap() {
        String temp = _from;

        _from = _to;
        _to = temp;

        updateCurrecyChoice();
        notifyListeners();
    }

    String convert(double value) {
        double base = value/_rates[_from];
        double target = base*_rates[_to];

        if(_isLoaded){
            return formatNumber(target);
        }
        else {
            return "";
        }
    }
}