import 'dart:math';
import 'package:flutter/material.dart';
import 'package:folding_cardboard/src/folding_cardboard_component.dart';
import 'package:folding_cardboard/src/lottery_ticket_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

      int intValue = Random().nextInt(90);
      List<int>list=[intValue];

    LotteryTicketModel lotteryTicket= LotteryTicketModel(number: 0010987, numberList: list);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.purple.shade50,
          body: Center(
            child: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FoldingCardboard(
                      textColor: Colors.blue.shade900,
                      title: 'Número de carton',
                      lotteryTicketModel: lotteryTicket,
                    ),
                    FoldingCardboard(
                      textColor: Colors.blue.shade900,
                      title: 'Número de carton',
                      lotteryTicketModel: lotteryTicket,
                    ),
                    FoldingCardboard(
                      textColor: Colors.blue.shade900,
                      title: 'Número de carton',
                      lotteryTicketModel: lotteryTicket,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
