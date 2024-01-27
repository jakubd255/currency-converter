import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
    const Flag({super.key, required this.code});

    final String code;

    @override
    Widget build(BuildContext context) {
        return(
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 63, 63, 63).withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3)
                        ),
                    ],
                ),
                child: Image.asset("assets/images/$code.png", width: 50),
            )
        );
    }
}