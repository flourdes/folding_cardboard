import 'package:flutter/material.dart';
import 'models/bingo_ticket_model.dart';

class FoldingCardboardComponentCustom extends StatefulWidget {
  final Color colorMain;
  final Color backgroundColor;
  final Color cellColor;
  final Color cellText;
  final String title;
  final BingoTicketModel bingoTicketModel;
  final EdgeInsetsGeometry padding;
  final double borderRadiusCircularCardBoard;
  final double borderRadiusCircularCell;

  const FoldingCardboardComponentCustom({
    Key? key,
    this.title = "Número de cartón",
    required this.bingoTicketModel,
    this.colorMain = const Color.fromARGB(255, 33, 82, 243),
    this.backgroundColor = Colors.white,
    this.cellText = Colors.black54,
    this.cellColor = const Color.fromARGB(255, 239, 239, 239),
    this.padding = const EdgeInsets.all(8),
    this.borderRadiusCircularCardBoard = 12,
    this.borderRadiusCircularCell = 6,
  }) : super(key: key);

  @override
  State<FoldingCardboardComponentCustom> createState() =>
      _FoldingCardboardComponentCustomState();
}

class _FoldingCardboardComponentCustomState
    extends State<FoldingCardboardComponentCustom> {
  bool _isOpen = false;
  double sizeTable = 0;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width.toDouble();
    late final double sizeCell = size / 9 >= 52 ? 52 : size / 9;
    late final double sizeNumber = size / 9 >= 52 ? 19.5 : size / 24;
    late final double sizeText = size / 9 >= 52 ? 19.5 : size / 24;
    late final double sizeContainerMainNumber =
        size / 5.2 >= 90 ? 90 : size / 5.2;
    late final double sizeIcon = size / 10.4 >= 45 ? 45 : size / 10.4;

    List<TableRow> cardboard = List.generate(
        5,
        (indexCol) => TableRow(
            children: List.generate(
                7,
                (indexRow) =>
                    _cell(indexCol * 7 + indexRow, sizeCell, sizeNumber))));
    return _expansionTable(
        cardboard, sizeCell, sizeText, sizeContainerMainNumber, sizeIcon);
  }

  void onTap() {
    setState(() {
      if (!_isOpen) {
        sizeTable = (MediaQuery.of(context).size.width.toDouble() / 9 >= 52
                ? 52
                : (MediaQuery.of(context).size.width.toDouble() / 9) * 5) +
            55;
      } else {
        sizeTable = 0;
      }
      _isOpen = !_isOpen;
    });
  }

  _cell(index, sizeCell, sizeNumber) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        //width: sizeCell,
        //height: sizeCell,
        margin: const EdgeInsets.all(
            5), //index%7 == 0 ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: widget.cellColor, //Colors.grey.shade200
            borderRadius: BorderRadius.circular(widget.borderRadiusCircularCell),
            /*boxShadow: [
              BoxShadow(
                color: widget.cellColor.withOpacity(0.9),
                blurRadius: 2,
                offset: const Offset(3.5, 3.5),
              ),
            ]*/
            ),
        alignment: Alignment.center,
        child: Text(
          addNumbers(index),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: sizeNumber,
            color: widget.cellText, //Colors.black54
          ),
        ),
      ),
    );
  }

  String addNumbers(index) {
    if (index < widget.bingoTicketModel.numberList.length) {
      return widget.bingoTicketModel.numberList[index].toString();
    } else {
      return "-";
    }
  }

  _expansionTable(
      cardboard, sizeCell, sizeText, sizeContainerMainNumber, sizeIcon) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(widget.borderRadiusCircularCardBoard),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ]),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(widget.borderRadiusCircularCardBoard),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
            ),
            child: Padding(
              padding: widget.padding, //const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: sizeText,
                            fontWeight: FontWeight.w500,
                            color: widget.colorMain, //colorMain
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: sizeContainerMainNumber / 2.5,
                                width: sizeContainerMainNumber,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: widget.colorMain, //colorMain
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  widget.bingoTicketModel.number.toString(),
                                  style: TextStyle(
                                    color: widget.colorMain, //colorMain
                                    fontWeight: FontWeight.w600,
                                    fontSize: sizeText / 1.15,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            AnimatedRotation(
                              turns: _isOpen ? -0.5 : 0,
                              duration: const Duration(milliseconds: 250),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: sizeIcon,
                                color: widget.colorMain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: _isOpen? 1 / 0.715 : 1 / 0.000000000001,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                      //height: _isOpen? sizeCell * 5 + 55: 0, //sizeCell*5+55, //(MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,//_isVisible ? sizeTable : (MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: widget.padding.vertical / 3,
                            right:
                                5), //const EdgeInsets.only(top: 10,left: 5,right: 10),
                        child: Table(
                          children: cardboard,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
