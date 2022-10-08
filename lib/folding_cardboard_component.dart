import 'package:flutter/material.dart';
import 'models/lottery_ticket_model.dart';

class FoldingCardboardComponent extends StatefulWidget {
  final String id = "folding_cardboard_component";
  final Color color;
  final String title;
  final LotteryTicketModel lotteryTicketModel;
  const FoldingCardboardComponent(
      {super.key,
      this.title = "Número de cartón",
      required this.lotteryTicketModel,
      this.color = Colors.blue});

  @override
  State<FoldingCardboardComponent> createState() =>
      _FoldingCardboardComponentState();
}

class _FoldingCardboardComponentState extends State<FoldingCardboardComponent> {
  @override
  Widget build(BuildContext context) {
     List<TableRow> carton = List.generate(
        5,
        (indexCol) => TableRow(
            children: List.generate(
                7,
                (int index) => Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.lotteryTicketModel.numberList[indexCol][index].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 125, 125, 125),
                        ),
                      ),
                    ))));
    return _expansionPanel(carton);
  }

  Widget _expansionPanel(carton) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: widget.color),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.lotteryTicketModel.number.toString(),
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, letterSpacing: 1),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          children: [
            Table(
              defaultColumnWidth: const FixedColumnWidth(50),
              children: carton,
            ),
          ],
        ),
      ),
    );
  }
}
