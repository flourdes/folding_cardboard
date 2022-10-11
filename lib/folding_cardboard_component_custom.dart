import 'package:flutter/material.dart';
import 'models/lottery_ticket_model.dart';

class FoldingCardboardComponentCustom extends StatefulWidget {
  final Color colorMain;
  final Color backgroundColor;
  final Color cellColor;
  final Color cellText;
  final String title;
  final LotteryTicketModel lotteryTicketModel;
  final EdgeInsetsGeometry padding;
  final double borderRadiusCircularCardBoard;
  final double borderRadiusCircularCell;

  const FoldingCardboardComponentCustom({
    Key? key,
    this.title = "Número de cartón",
    required this.lotteryTicketModel,
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
    extends State<FoldingCardboardComponentCustom>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  double sizeTable = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width.toDouble();
    late final double sizeCell = size / 9 >= 52 ? 52 : size / 9;
    late final double sizeNumber = size / 9 >= 52 ? 19.5 : size / 24;
    late final double sizeText = size / 9 >= 52 ? 19.5 : size / 24;
    late final double sizeContainerMainNumber =
        size / 5.2 >= 90 ? 90 : size / 5.2;
    late final double sizeIcon = size / 10.4 >= 45 ? 45 : size / 10.4;

    List<TableRow> carton = List.generate(
        5,
        (indexCol) => TableRow(
            children: List.generate(
                7,
                (indexRow) =>
                    _cell(indexCol * 7 + indexRow, sizeCell, sizeNumber))));
    return _expansionTable(
        carton, sizeCell, sizeText, sizeContainerMainNumber, sizeIcon);
  }

  void onTap() {
    setState(() {
      if (!_isVisible) {
        _controller.reverse(from: 0.5);
        sizeTable = (MediaQuery.of(context).size.width.toDouble() / 9 >= 52
                ? 52
                : (MediaQuery.of(context).size.width.toDouble() / 9) * 5) +
            55;
      } else {
        _controller.forward(from: 0.0);
        sizeTable = 0;
      }
      _isVisible = !_isVisible;
    });
  }

  _cell(index, sizeCell, sizeNumber) {
    return Container(
      width: sizeCell,
      height: sizeCell,
      margin: const EdgeInsets.all(
          5), //index%7 == 0 ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: widget.cellColor, //Colors.grey.shade200
          borderRadius: BorderRadius.circular(widget.borderRadiusCircularCell),
          boxShadow: [
            BoxShadow(
              color: widget.cellColor.withOpacity(0.9),
              blurRadius: 2,
              offset: const Offset(3.5, 3.5),
            ),
          ]),
      alignment: Alignment.center,
      child: Text(
        addNumbers(index),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sizeNumber,
          color: widget.cellText, //Colors.black54
        ),
      ),
    );
  }

  String addNumbers(index) {
    if (index < widget.lotteryTicketModel.numberList.length) {
      return widget.lotteryTicketModel.numberList[index].toString();
    } else {
      return "";
    }
  }

  _expansionTable(
      carton, sizeCell, sizeText, sizeContainerMainNumber, sizeIcon) {
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
            child: Padding(
              padding: widget
                  .padding, //const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
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
                            Container(
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
                                widget.lotteryTicketModel.number.toString(),
                                style: TextStyle(
                                  color: widget.colorMain, //colorMain
                                  fontWeight: FontWeight.w600,
                                  fontSize: sizeText / 1.15,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            AnimatedRotation(
                              turns: _isVisible ? 0 : -0.5, 
                              duration: const Duration(milliseconds:200),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: sizeIcon,
                                color: widget.colorMain,
                              ),),
                              /*
                            RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0)
                                  .animate(_controller),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: sizeIcon,
                                color: widget.colorMain,
                              ),
                            ),
                            */
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    height: _isVisible
                        ? sizeCell * 5 + 55
                        : 0, //sizeCell*5+55, //(MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,//_isVisible ? sizeTable : (MediaQuery.of(context).size.width.toDouble() / 9 >= 52 ? 52 : (MediaQuery.of(context).size.width.toDouble() / 9)*5) + 55,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: widget.padding.vertical /
                              3), //const EdgeInsets.only(top: 10,left: 5,right: 10),
                      child: Table(
                        children: carton,
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
