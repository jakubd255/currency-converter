import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../functions/format_number.dart';

class ExchangeProvider extends ChangeNotifier {
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

    late String _base;
    String get base => _base;


    ExchangeProvider(BuildContext context);

    void initialize() async {
        final response = await Dio().get("https://api.frankfurter.app/latest?from=USD");

        if(response.statusCode == 200) {
            _base = response.data["base"];
            _rates = response.data["rates"];
            _rates[_base] = 1.0;

            _isLoaded = true;
        }
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
        notifyListeners();
    }

    void swap() {
        String temp = _from;

        _from = _to;
        _to = temp;

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