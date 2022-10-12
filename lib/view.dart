import 'dart:math';
import 'package:flutter/material.dart';
import 'package:folding_cardboard/folding_cardboard_component_custom.dart';
import 'models/bingo_ticket_model.dart';

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
      for (int i = 0; i < 33; i++) {
        numbers.add(_numberUnique(100,numbers));
      }
      return numbers;
    }

    BingoTicketModel lotteryTicket =
        BingoTicketModel(number: 106044, numberList: _numbersList());
    BingoTicketModel lotteryTicketB =
        BingoTicketModel(number: 106040, numberList: _numbersList());
    BingoTicketModel lotteryTicketC =
        BingoTicketModel(number: 109033, numberList: _numbersList());
    BingoTicketModel lotteryTicketD =
        BingoTicketModel(number: 102099, numberList: _numbersList());
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
                  bingoTicketModel: lotteryTicket,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FoldingCardboardComponentCustom(
                    bingoTicketModel: lotteryTicketB,)
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FoldingCardboardComponentCustom(
                    bingoTicketModel: lotteryTicketC,
                    padding: const EdgeInsets.all(20),),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FoldingCardboardComponentCustom(
                    bingoTicketModel: lotteryTicketD,
                    backgroundColor: Colors.blueAccent,
                    borderRadiusCircularCardBoard: 24,
                    borderRadiusCircularCell: 12,
                    cellColor: Colors.black,
                    cellText: Colors.white,
                    colorMain: Colors.white,
                    title: "Otro titulo para la tarjeta",
                    padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
