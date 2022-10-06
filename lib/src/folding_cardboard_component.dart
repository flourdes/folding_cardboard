import 'dart:math';
import'package:flutter/material.dart';
import 'package:folding_cardboard/src/lottery_ticket_model.dart';

class FoldingCardboard extends StatefulWidget {
  final Color color;
  final String title;
  final LotteryTicketModel lotteryTicketModel;
  const FoldingCardboard({Key? key,
    required this.title,
    required this.lotteryTicketModel,
    this.color= Colors.white}) : super(key: key);

  @override
  State<FoldingCardboard> createState() => _FoldingCardboardState();
}

class _FoldingCardboardState extends State<FoldingCardboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.black26,
                blurRadius: 7,
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ExpansionTile(
              childrenPadding: const EdgeInsets.symmetric(vertical: 10),
              expandedAlignment: Alignment.centerRight,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              iconColor: Colors.blue.shade900,
              collapsedIconColor: Colors.blue.shade900,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.title, style: TextStyle(color: Colors.blue.shade900),),
                  ),
                  _numberLottery(),
                ],
              ),
              children: [
                _cellsColumn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<TableRow> carton = List.generate(
      5, (index) => List.generate(
      7, (index) => _cells()))
  _cellsColumn(){
    return SizedBox(
      height: 35,
      width: 35,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context,index) => _cells()
      ),
    );
  }
  _cells(){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            Random().nextInt(90).toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
  _numberLottery(){
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: Colors.blue.shade900),
      ),
      child: Center(
        child: Text(
          widget.lotteryTicketModel.number.toString(),
          style: TextStyle(fontSize: 20,color: Colors.blue.shade700),
        ),
      ),
    );
  }
  List<int> numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
  27,28,29,30,31,32,33,34,35];
}
