import 'package:flutter/material.dart';
import 'package:ui_project/widgets/card_industral_land.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('xentice',
            style: TextStyle(
                color: Colors.blue[700],
                fontSize: 35,
                fontWeight: FontWeight.w400)),
        leading: Icon(Icons.sort, color: Colors.blue[900], size: 35),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .03),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/images/memberIcon.png'),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * .03),
          //search box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: Container(
              height: size.height * .05,
              child: TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon:
                      Icon(Icons.search, size: 28, color: Colors.black26),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .015,
          ),
          //property Services button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: Row(
              children: [
                Container(
                  height: size.height * .045,
                  width: size.width * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black26,
                      )),
                  child: Center(
                    child: Text(
                      'Property',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  height: size.height * .045,
                  width: size.width * .3,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Text(
                      'Services',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          //card industrial land
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            child: Container(
              height: size.height * .1,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardIndustrialLand();
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: size.width * .03),
                  itemCount: 4),
            ),
          ),
          SizedBox(height: size.height * .03),
          Padding(
            padding: EdgeInsets.only(left: size.width * .02),
            child: Text(
              'Commerial Office',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Align(
            alignment: Alignment(1, 0),
            child: Padding(
              padding: EdgeInsets.only(right: size.width * .03),
              child: Text(
                'see all',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black54),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
