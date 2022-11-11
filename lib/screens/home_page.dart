import 'package:flutter/material.dart';
import 'package:ui_project/screens/property_screen.dart';
import 'package:ui_project/widgets/card_industral_land.dart';
import 'package:shimmer/shimmer.dart';

import '../services.dart';
import '../widgets/office_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = true;
  var isSelected;
  @override
  void initState() {
    Services.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar
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
      body: SingleChildScrollView(
        child: Column(
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
                  InkWell(
                    onTap: () {
                      isClicked = true;
                      setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyScreen(),));
                    },
                    child: Container(
                      height: size.height * .045,
                      width: size.width * .3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: isClicked == true
                              ? Border.all(
                                  color: Colors.black26,
                                )
                              : null),
                      child: Center(
                        child: Text(
                          'Property',
                          style: isClicked == true
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isClicked = false;
                      setState(() {});
                    },
                    child: Container(
                      height: size.height * .045,
                      width: size.width * .3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: isClicked != true
                              ? Border.all(
                                  color: Colors.black26,
                                )
                              : null),
                      child: Center(
                        child: Text(
                          'Services',
                          style: isClicked != true
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15)
                              : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 15),
                        ),
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
                      return InkWell(
                        onTap: () {
                          isSelected=index;
                          setState(() {

                          });
                        },
                          child: CardIndustrialLand(isSelected: isSelected,index: index,));
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: size.width * .03),
                    itemCount: 4),
              ),
            ),
            SizedBox(height: size.height * .03),
            //Commercial office
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Text(
                'Commercial Office',
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
            SizedBox(height: size.height*.02,),
            SizedBox(height: size.height * .225,
              width: double.infinity,
              child: FutureBuilder(
                future: Services.getData(),
                builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: size.height * .225,
                      width: size.width * .48,
                      color: Colors.white,
                    ),
                  );
                }else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }else{
                  return Container(
                    height: size.height * .225,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.025),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => OfficeCard(images: snapshot.data[index].images.toString(),officeName: snapshot.data[index].propertyType,location: snapshot.data[index].location),
                      separatorBuilder: (context, index) => SizedBox(width: size.width*.02,),
                    ),
                  );
                }
              },),
            ),
            SizedBox(height: size.height * .03),
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Text(
                'Commercial Office',
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
            SizedBox(height: size.height*.02,),
            // Container(
            //   height: size.height * .22,
            //   child: ListView.separated(
            //     padding: EdgeInsets.symmetric(horizontal: size.width*.025),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     itemBuilder: (context, index) => OfficeCard(),
            //     separatorBuilder: (context, index) => SizedBox(width: size.width*.02,),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
