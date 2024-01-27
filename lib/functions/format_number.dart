String formatNumber(double number) {
    if(number.toInt() == number) {
        return number.toInt().toString();
    }
    else if(number < 0.1) {
        String stringValue = number.toString().contains(".00") ? 
            number.toStringAsFixed(5) 
            : number.toStringAsFixed(2);

        if(stringValue[stringValue.length - 1] == "0" && stringValue.contains(".")) {
            return stringValue.substring(0, stringValue.length - 1);
        }
        return stringValue;
    }
    else {
        String stringValue = number.toStringAsFixed(3);

        if(stringValue.endsWith("0") && stringValue.contains(".")) {
            stringValue = stringValue.replaceAll(RegExp(r"0*$"), "");
            stringValue = stringValue.replaceAll(RegExp(r"\.$"), "");
        }
        return stringValue;
    }
}