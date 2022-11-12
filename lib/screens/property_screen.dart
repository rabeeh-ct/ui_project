import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:ui_project/widgets/card_industral_land.dart';

class PropertyScreen extends StatefulWidget {
  PropertyScreen({Key? key,required List this.propertyType}) : super(key: key);
  List propertyType;

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  var isSelected;

  TextEditingController propertyctr = TextEditingController();
  TextEditingController seatCtr = TextEditingController();
  TextEditingController priceCtr = TextEditingController();
  TextEditingController buildCtr = TextEditingController();
  TextEditingController plotCtr = TextEditingController();

  @override
  void initState() {
    propertyctr.text = 'Woxro office';
    priceCtr.text = '2500';
    buildCtr.text = '2500';
    plotCtr.text = '2500';
    seatCtr.text = '100';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      currentStep: 1,
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
                        '1/4',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                        'Property',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .005,
                      ),
                      Text(
                        'Progress Details  >',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: SizedBox(
                width: double.infinity,
                height: size.height * .37,
                child: GridView.builder(
                  itemCount: widget.propertyType.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(size.width * .02),
                      child: InkWell(
                          onTap: () {
                            print(index);
                            setState(() {
                              isSelected = index;
                            });
                          },
                          child: CardIndustrialLand(
                            propertyType: widget.propertyType[index],
                            isSelected: isSelected,
                            index: index,
                          )),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: TextField(
                controller: propertyctr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    isDense: true,
                    labelText: 'Property Title',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Text(
                'Transaction Type',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
            Container(
              width: size.width * .8,
              child: Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Sell'),
                        value: "radio value",
                        groupValue: "trascationType",
                        onChanged: (value) {
                          setState(() {

                          });
                          print(value); //selected value
                        }),
                  ),
                  Flexible(
                    child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Rent'),
                        value: "radio value",
                        groupValue: "trascationType",
                        onChanged: (value) {
                          setState(() {

                          });
                          print(value); //selected value
                        }),
                  ),
                  Flexible(
                    child: RadioListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Lease'),
                        value: "radio value",
                        groupValue: "trascationType",
                        onChanged: (value) {
                          setState(() {

                          });
                          print(value); //selected value
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      controller: priceCtr,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          isDense: true,
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38))),
                    ),
                  ),
                  SizedBox(width: size.width*.03),
                  Container(
                    height: size.height*.064,
                    width: size.width*.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38)),
                    child: Center(child: Text('/Hr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      controller: buildCtr,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          isDense: true,
                          labelText: 'Build Area',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38))),
                    ),
                  ),
                  SizedBox(width: size.width*.03),
                  Container(
                    height: size.height*.064,
                    width: size.width*.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38)),
                    child: Center(child: Text('/Hr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      controller: plotCtr,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          isDense: true,
                          labelText: 'Plot Area',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38))),
                    ),
                  ),
                  SizedBox(width: size.width*.03),
                  Container(
                    height: size.height*.064,
                    width: size.width*.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38)),
                    child: Center(child: Text('/Hr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: TextField(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                controller: seatCtr,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    isDense: true,
                    labelText: 'Seating Capacity',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38))),
              ),
            ),
            SizedBox(height: size.height*.02,)
          ],
        ),
      ),
    );
  }
}
