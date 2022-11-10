import 'package:flutter/material.dart';

class CardIndustrialLand extends StatefulWidget {
   CardIndustrialLand({Key? key,required var this.isSelected,required var this.index}) : super(key: key);
  var isSelected;
  var index;

  @override
  State<CardIndustrialLand> createState() => _CardIndustrialLandState();
}

class _CardIndustrialLandState extends State<CardIndustrialLand> {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width * .2,
      decoration: BoxDecoration(
        color: widget.isSelected==widget.index?Colors.indigo[900]:Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/icon.png',color: widget.isSelected==widget.index?Colors.white:Colors.black87,
              width: size.width * .1),
          Text('Industrial',
              style: TextStyle(
                  color: widget.isSelected==widget.index?Colors.white:Colors.black54,
                  fontWeight: FontWeight.w500)),
          Text('land',
              style: TextStyle(
                  color: widget.isSelected==widget.index?Colors.white:Colors.black54,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
