import'package:flutter/material.dart';
import 'package:folding_cardboard/src/lottery_ticket_model.dart';

class FoldingCardboard extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final LotteryTicketModel lotteryTicketModel;
  const FoldingCardboard({Key? key,
    required this.title,
    required this.lotteryTicketModel,
    this.textColor = Colors.blue,
    this.backgroundColor = Colors.white}) : super(key: key);

  @override
  State<FoldingCardboard> createState() => _FoldingCardboardState();
}

class _FoldingCardboardState extends State<FoldingCardboard> {
  @override
  Widget build(BuildContext context) {
    List<TableRow> numbersLottery = List.generate(
        5, (indexCol) => TableRow(children: List.generate(
        7, (indexRow) => _cells((indexCol*7+indexRow)))));
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
          child: _expansionTile(numbersLottery),
        ),
      ),
    );
  }

  _expansionTile(numbersLottery){
    return ExpansionTile(
      childrenPadding: const EdgeInsets.all(10),
      expandedAlignment: Alignment.centerRight,
      backgroundColor: widget.backgroundColor,
      collapsedBackgroundColor: widget.backgroundColor,
      iconColor: widget.textColor,
      collapsedIconColor: widget.textColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
          ),
          _numberLotteryID(),
        ],
      ),
      children: [
        Table(
          children: numbersLottery,
        )
      ],
    );
  }
  _numberLotteryID(){
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: widget.textColor),
      ),
      child: Center(
        child: Text(
          widget.lotteryTicketModel.number.toString(),
          style: TextStyle(fontSize: 20,color: widget.textColor,letterSpacing: 2),
        ),
      ),
    );
  }
  _cells(index){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            addNumbersLottery(index),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
  String addNumbersLottery(index){
    if(index < widget.lotteryTicketModel.numberList.length){//numbers.length){
      return widget.lotteryTicketModel.numberList[index].toString();//numbers[index].toString();
    }else{
      return "-";
    }
  }

  List<int> numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
  27,28,29,30,31,32,33,34];

}
