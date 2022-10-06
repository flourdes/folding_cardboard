import 'package:flutter/material.dart';
import 'folding_cardboard_component.dart';
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

    _generarCarton(n) {
      List<List<int>> carton = [];
      for (int i = 0; i < 5; i++) {
        carton.add([
          n + i,
          n + i * 2,
          n + i * 3,
          n + i * 4,
          n + i * 5,
          n + i * 6,
          n + i * 7
        ]);
      }
      return carton;
    }

    List<List<int>> cartonA = _generarCarton(2);
    List<List<int>> cartonB = _generarCarton(5);
    List<List<int>> cartonC = _generarCarton(7);

    LotteryTicketModel lotteryTicketA =
        LotteryTicketModel(number: 109870, numberList: cartonA);
    LotteryTicketModel lotteryTicketB =
        LotteryTicketModel(number: 109871, numberList: cartonB);
LotteryTicketModel lotteryTicketC =
        LotteryTicketModel(number: 109872, numberList: cartonC);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Bingooo"),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FoldingCardboardComponent(lotteryTicketModel: lotteryTicketA),
                  const SizedBox(
                    height: 30,
                  ),
                  FoldingCardboardComponent(lotteryTicketModel: lotteryTicketB),
                  const SizedBox(
                    height: 30,
                  ),
                  FoldingCardboardComponent(lotteryTicketModel: lotteryTicketC),
                ],
              ),
          ),
        );
  }
}