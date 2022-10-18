import 'dart:math';

import 'package:flutter/material.dart';
import 'package:folding_cardboard/folding_cardboard_component.dart';
import 'folding_cardboard_component_custom.dart';
import 'models/bingo_ticket_model.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

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


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: _cuadrado(),
        actions: [
          _cuadrado(),
          _cuadrado()
        ],
      ),
        body: Container(
          width: double.infinity,
          color: Colors.teal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Mis cartones'),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20), topLeft: Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 130,
                              child: Text(
                                '10° Bingo Ayuda para los callejeritos'
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FoldingCardboardComponentCustom(bingoTicketModel: bingoTicket,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FoldingCardboardComponentCustom(bingoTicketModel: bingoTicketB,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FoldingCardboardComponentCustom(bingoTicketModel: bingoTicketC,),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  Widget _cuadrado(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}
