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

    int numberUnique(int limit, List<int> numbers) {
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

    List<int> numbersList() {
      List<int> numbers = [];
      for (int i = 0; i < 33; i++) {
        numbers.add(numberUnique(100,numbers));
      }
      return numbers;
    }

    BingoTicketModel bingoTicket =
        BingoTicketModel(number: 106044, numberList: numbersList());
    BingoTicketModel bingoTicketB =
        BingoTicketModel(number: 106040, numberList: numbersList());
    BingoTicketModel bingoTicketC =
        BingoTicketModel(number: 109033, numberList: numbersList());
    BingoTicketModel bingoTicketD =
        BingoTicketModel(number: 102099, numberList: numbersList());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background4.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: const Text("Bingooo"),),
        body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FoldingCardboardComponentCustom(
                      bingoTicketModel: bingoTicket,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FoldingCardboardComponentCustom(
                        bingoTicketModel: bingoTicketB,)
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FoldingCardboardComponentCustom(
                        bingoTicketModel: bingoTicketC,
                        padding: const EdgeInsets.all(20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FoldingCardboardComponentCustom(
                        bingoTicketModel: bingoTicketD,
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

