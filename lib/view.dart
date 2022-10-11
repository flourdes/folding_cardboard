import 'dart:math';
import 'package:flutter/material.dart';
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
    Random rnd = Random();

    int _numberUnique(int limit, List<int> numbers) {
    bool flag = false;
    int random = 0;
    if (numbers.isEmpty) {
      return rnd.nextInt(limit) + 1;
    }
    while (!flag) {
      random = rnd.nextInt(limit) + 1;
      flag = !numbers.contains(random);
    }
    return random;
    }

    List<int> _numbersList() {
      List<int> numbers = [];
      for (int i = 0; i < 35; i++) {
        numbers.add(_numberUnique(100,numbers));
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
        decoration: const BoxDecoration(
          color: Colors.grey, //Colors.white38
          gradient: LinearGradient(
            colors: [Colors.pink,Colors.white],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FoldingCardboardComponentCustom(
                  lotteryTicketModel: lotteryTicket,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket,
                  padding: const EdgeInsets.all(20),)
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FoldingCardboardComponentCustom(
                    lotteryTicketModel: lotteryTicket),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
