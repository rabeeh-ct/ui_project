import 'dart:convert';

import 'package:http/http.dart';
import 'package:ui_project/model/propert_model.dart';

class Services{
  static List correctdata = [];


  static Future getData()async{
    Response res=await get(Uri.parse('https://api.xentice.com/api/postadSelect'));
    // print(res.body);
    var jsonData= jsonDecode(res.body);
    // print('.............................................');
    List<Property> properties =[];
    // print(a["name"]);
    // var a=(jsonDecode(jsonData[0]['propertyType']))["name"];
    // print(a);
    for(var u in jsonData){
      var propertyType=(jsonDecode(u['propertyType']))["name"];
      var transactionType=(jsonDecode(u['transactionType']))["name"];
      List location=[];
      location.add((jsonDecode(u['location']))["country"]);
      location.add((jsonDecode(u['location']))["city"]);
      location.add((jsonDecode(u['location']))["locality"]);
      location.add((jsonDecode(u['location']))["street"]);
      location.add((((jsonDecode(u['location']))["cord"])["location"])["lat"]);
      location.add((((jsonDecode(u['location']))["cord"])["location"])["lng"]);

      var details=(jsonDecode(u['details']))["title"];
      var priceRange=(jsonDecode(u['priceRange']))["start"];
      var images=(jsonDecode(u['images']))[0];
      Property property=Property(propertyType, transactionType, location, details, priceRange, images);
      properties.add(property);

    }
    List temp = [];

    for (int i = 0; i < properties.length; i++) {
      temp.add(properties[i].propertyType);
    }
    correctdata=temp.toSet().toList();
    // print(properties.length);
    return properties;
  }
}