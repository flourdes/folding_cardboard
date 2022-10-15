import 'dart:math';
import 'package:flutter/material.dart';
import 'package:folding_cardboard/folding_cardboard_component_custom.dart';
import 'models/bingo_ticket_model.dart';

class View extends StatefulWidget {
  final String id = "view";
  final bool changeCard = true;
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
        numbers.add(_numberUnique(90,numbers));
      }
      return numbers;
    }

    BingoTicketModel lotteryTicketA =
        BingoTicketModel(number: 106044, numberList: _numbersList());
    BingoTicketModel lotteryTicketB =
        BingoTicketModel(number: 106040, numberList: _numbersList());
    BingoTicketModel lotteryTicketC =
        BingoTicketModel(number: 109033, numberList: _numbersList());
    BingoTicketModel lotteryTicketD =
        BingoTicketModel(number: 102099, numberList: _numbersList());
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration( //Colors.white38
            gradient: LinearGradient(
              colors: [Colors.pink,Colors.white],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            )
          ),
          child: Column(
            children: [
              const SizedBox(height: 100,),
              _cardboard(lotteryTicketA, lotteryTicketB, lotteryTicketC, lotteryTicketD),
            ],
          ),
        ),
      ),
    );
  }
  bool changeEdit = false;
  bool change = true;
  void onTap(){
    setState(() {
      changeEdit = !changeEdit;
      change = !change;
    });
  }
  _cardboard(lotteryTicketA,lotteryTicketB,lotteryTicketC,lotteryTicketD){
    return Expanded(
      child: Visibility(
        visible: change,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white54,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    Text(
                      "BINGO",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue.shade800,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _card(lotteryTicketA),
                          const SizedBox(
                            height: 30,
                          ),_card(lotteryTicketB),
                          const SizedBox(
                            height: 30,
                          ),_card(lotteryTicketC),
                          const SizedBox(
                            height: 30,
                          ),_card(lotteryTicketD),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  _card (lotteryTicket){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FoldingCardboardComponentCustom(
        bingoTicketModel: lotteryTicket,
        mainColor: Colors.blue.shade900,
        iconColor: Colors.blue.shade800,
      ),
    );
  }
}
