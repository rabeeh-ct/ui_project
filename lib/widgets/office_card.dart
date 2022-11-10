import 'package:flutter/material.dart';
import 'package:ui_project/screens/location_screen.dart';

class OfficeCard extends StatefulWidget {
  const OfficeCard({Key? key}) : super(key: key);

  @override
  State<OfficeCard> createState() => _OfficeCardState();
}

class _OfficeCardState extends State<OfficeCard> {
  bool isItFavorite = false;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(),)),
      child: Container(
        height: size.height * .22,
        width: size.width * .48,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/office.png',
                    )),
                Positioned(
                  top: size.height * .01,
                  right: size.width * .02,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isItFavorite = !isItFavorite;
                      });
                    },
                    child: isItFavorite == false
                        ? CircleAvatar(
                      backgroundColor: Colors.black38,
                      radius: size.width * .03,
                      child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: size.width * .035,
                            color: Colors.white,
                          )),
                    )
                        : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: size.width * .03,
                      child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: size.width * .035,
                            color: Colors.red,
                          )),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:size.width*.02),
              child: Column(
                children: [
                  SizedBox(height: size.height*.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Woxro office',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Rs. 2500/Hr',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                            fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(height: size.height*.01,),
                  Row(
                    children: [
                      Icon(Icons.location_pin,color: Colors.green[800]),
                      Text('Thrissur',style: TextStyle(fontWeight:  FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
