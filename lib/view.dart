import 'dart:math';

import 'package:flutter/material.dart';
import 'package:folding_cardboard/folding_cardboard_component.dart';
import 'package:folding_cardboard/folding_cardboard_component_custom.dart';
import 'models/lottery_ticket_model.dart';

class View extends StatefulWidget {
  final String id = "view";
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    _numbersList() {
      List<int> numbers = [];
      for (int i = 0; i < 30; i++) {
        numbers.add(Random().nextInt(90));
      }
      return numbers;
    }

    LotteryTicketModel lotteryTicket =
        LotteryTicketModel(number: 109870, numberList: _numbersList());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bingooo"),
      ),
      body: Container(
        color: Colors.white38,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket),
              ),
              const SizedBox(
                height: 30,
              ),
              FoldingCardboardComponent(lotteryTicketModel: lotteryTicket),
              const SizedBox(
                height: 30,
              ),
              FoldingCardboardComponent(lotteryTicketModel: lotteryTicket),
              const SizedBox(
                height: 30,
              ),
              FoldingCardboardComponent(lotteryTicketModel: lotteryTicket),
            ],
          ),
        ),
      ),
    );
  }
}
