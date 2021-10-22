import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BotaoIniciarAtividadeWidget extends GetView {
  final String title;
  final Function() onPressed;

  const BotaoIniciarAtividadeWidget(
      {required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: primaryColor,
      height: 135,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                child: const Icon(
                                  Icons.check_circle_outline,
                                  size: 77,
                                  color: Colors.white,
                                ),
                                onTap: onPressed,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
