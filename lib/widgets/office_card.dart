import 'package:flutter/material.dart';
import 'package:ui_project/screens/location_screen.dart';

class OfficeCard extends StatefulWidget {
  OfficeCard(
      {Key? key,
      required this.images,
      required this.location,
      required this.officeName})
      : super(key: key);
  String images, officeName;
  List location;

  @override
  State<OfficeCard> createState() => _OfficeCardState();
}

class _OfficeCardState extends State<OfficeCard> {
  bool isItFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(location: widget.location),
          )),
      child: Container(
        height: size.height * .225,
        width: size.width * .48,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                    height: size.height*.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(widget.images,fit: BoxFit.cover,)),
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
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          widget.officeName,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          'Rs. 2500/Hr',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w800,
                              fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.green[800]),
                      Text(widget.location[1],
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
