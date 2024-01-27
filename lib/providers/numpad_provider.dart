import 'package:flutter/cupertino.dart';
import '../functions/format_number.dart';

class NumpadProvider extends ChangeNotifier {
    String _displayedNum = "0";
    String get displayedNum => _displayedNum;

    String _bufferNum = "0";
    String? _selectedOperation;
    String? _operation;

    NumpadProvider(BuildContext context);

    void clear() {
        _displayedNum = "0";
        _bufferNum = "0";
        _selectedOperation = null;
        _operation = null;

        notifyListeners();
    }

    void undo() {
        if(_displayedNum.length > 1) {
            _displayedNum = _displayedNum.substring(0, _displayedNum.length - 1);
        }
        else {
            _displayedNum = "0";
        }
        notifyListeners();
    }

    void setPoint() {
        if(!_displayedNum.contains(".")) {
            _displayedNum += ".";

            notifyListeners();
        }
    }

    void clickOperator(String operator) {
        if(_operation != null) {
            _calculate();
        }
        _bufferNum = _displayedNum;
        _selectedOperation = operator;
        _operation = operator;

        notifyListeners();
    }

    void clickNumber(String number) {
        if(_displayedNum.length < 20) {
            if(_displayedNum == "0" || _selectedOperation != null) {
                _displayedNum = number;
            }
            else {
                _displayedNum += number;
            }

            if(_selectedOperation != null) {
                _operation = _selectedOperation;
                _selectedOperation = null;
            }

            notifyListeners();
        }
    }

    void clickEquals() {
        _calculate();

        _selectedOperation = null;
        _operation = null;

        notifyListeners();
    }

    void _calculate() {
        double rightNum = double.parse(_displayedNum);
        double leftNum = double.parse(_bufferNum);
        double result = 0;

        if(_operation != null) {
            if(_operation == "/") {
                if(rightNum != 0) {
                    result = leftNum / rightNum;
                }
                else {
                    result = 0;
                }
            }
            else if(_operation == "*") {
                result = leftNum * rightNum;
            }
            else if(_operation == "-") {
                result = leftNum - rightNum;
            }
            else if(_operation == "+") {
                result = leftNum + rightNum;
            }
        }
        else {
            result = rightNum;
        }

        _bufferNum = result.toString();
        _displayedNum = formatNumber(result);
    }
}