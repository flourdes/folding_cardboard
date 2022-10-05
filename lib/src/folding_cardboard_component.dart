import'package:flutter/material.dart';
import 'package:folding_cardboard/src/lottery_ticket_model.dart';

class FoldingCardboard extends StatefulWidget {
  final Color color;
  final String title;
  final LotteryTicketModel lotteryTicketModel;
  const FoldingCardboard({Key? key,
    required this.title,
    required this.lotteryTicketModel,
    this.color= Colors.blue}) : super(key: key);

  @override
  State<FoldingCardboard> createState() => _FoldingCardboardState();
}

class _FoldingCardboardState extends State<FoldingCardboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(widget.title, style: TextStyle(color: widget.color),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _numberLottery(),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.arrow_drop_down),),
            ],
          ),
        ],
      ),
    );
  }

  _numberLottery(){
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: widget.color),
      ),
      child: Center(
        child: Text(
          widget.lotteryTicketModel.number.toString(),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
