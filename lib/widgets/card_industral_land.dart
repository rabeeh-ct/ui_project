import 'package:flutter/material.dart';

class CardIndustrialLand extends StatelessWidget {
  const CardIndustrialLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width * .2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/icon.png',
              width: size.width * .1),
          Text('Industrial',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500)),
          Text('land',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
