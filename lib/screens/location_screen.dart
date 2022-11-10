import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController cityCtr = TextEditingController();

  TextEditingController localityCtr = TextEditingController();

  TextEditingController streetCtr = TextEditingController();

  @override
  void initState() {
    cityCtr.text = 'Cochin';
    localityCtr.text = 'Cochin';
    streetCtr.text = 'Cochin';
    super.initState();
  }

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
        children: [
          //progress Indicator.........................................
          Container(
            width: size.width,
            height: size.height * .1,
            color: Colors.grey[300],
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                  child: CircularStepProgressIndicator(
                    totalSteps: 4,
                    currentStep: 3,
                    stepSize: 10,
                    selectedColor: Colors.indigo[900],
                    unselectedColor: Colors.white,
                    padding: 0,
                    width: size.height * .075,
                    height: size.height * .075,
                    selectedStepSize: 10,
                    roundedCap: (_, __) => false,
                    child: Center(
                        child: Text(
                      '3/4',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      'Progress Details  >',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: 'India',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey),
            ),
          ),
          SizedBox(
            height: size.height * .025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              controller: cityCtr,
              readOnly: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  isDense: true,
                  labelText: 'City',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38))),
            ),
          ),
          SizedBox(
            height: size.height * .025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              controller: localityCtr,
              readOnly: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  isDense: true,
                  labelText: 'Locality',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38))),
            ),
          ),
          SizedBox(
            height: size.height * .025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              controller: streetCtr,
              readOnly: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  isDense: true,
                  labelText: 'Street',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38))),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          //map....................................................................
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Container(
              height: size.height * .3,
              width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/map.png'))),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * .4,
                  height: size.height * .055,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.indigo[900]!)),
                  child: Center(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.indigo[900]),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * .4,
                  height: size.height * .055,
                  decoration: BoxDecoration(
                    color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.indigo[900]!)),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
