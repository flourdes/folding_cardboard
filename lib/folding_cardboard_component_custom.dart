import 'package:flutter/material.dart';
import 'models/bingo_ticket_model.dart';

class FoldingCardboardComponentCustom extends StatefulWidget {
  final Color mainColor;
  final Color iconColor;
  final Color backgroundColor;
  final Color cellColor;
  final Color cellColorText;
  final String title;
  final BingoTicketModel bingoTicketModel;
  final EdgeInsetsGeometry padding;
  final double borderRadiusCircularCardBoard;
  final double borderRadiusCircularCell;

  const FoldingCardboardComponentCustom({
    Key? key,
    this.title = "Número de cartón",
    required this.bingoTicketModel,
    this.mainColor = const Color.fromARGB(255, 33, 82, 243),
    this.iconColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.cellColorText = Colors.black54,
    this.cellColor = const Color.fromARGB(255, 239, 239, 239),
    this.padding = const EdgeInsets.all(0),
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
    late final double sizeCell = size / 9;
    late final double sizeNumber = size / 24;
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
      _isOpen = !_isOpen;
    });
  }

  _cell(index, sizeCell, sizeNumber) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        bottom: 12,
      ),
      child: Container(
        width: sizeCell,
        height: sizeCell,
        //margin: const EdgeInsets.all(6), //index%7 == 0 ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: widget.cellColor, //Colors.grey.shade200
            borderRadius:
                BorderRadius.circular(widget.borderRadiusCircularCell),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(0.5),
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ]),
        alignment: Alignment.center,
        child: Text(
          addNumbers(index),
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: sizeNumber,
            color: widget.cellColorText, //Colors.black54
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
              color: Colors.black.withOpacity(0.5),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: sizeText,
                          fontWeight: FontWeight.w500,
                          color: widget.mainColor, //colorMain
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
                                  color: widget.mainColor, //colorMain
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.bingoTicketModel.number.toString(),
                                style: TextStyle(
                                  color: widget.mainColor, //colorMain
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
                              color: widget.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                  height: _isOpen
                      ? sizeCell * 5 + 74
                      : 0, //sizeCell*5+55, //(MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,//_isVisible ? sizeTable : (MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 3,
                      right: 3,
                      left: 15,
                    ), //const EdgeInsets.only(top: 10,left: 5,right: 10),
                    child: Table(
                      children: cardboard,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
