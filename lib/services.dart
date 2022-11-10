import 'dart:convert';

import 'package:http/http.dart';
import 'package:ui_project/model/propert_model.dart';

class Services{

  static Future getData()async{
    Response res=await get(Uri.parse('https://api.xentice.com/api/postadSelect'));
    // print(res.body);
    var jsonData= jsonDecode(res.body);
    print('.............................................');
    List<Property> properties =[];
    // print(a["name"]);
    // var a=(jsonDecode(jsonData[0]['propertyType']))["name"];
    // print(a);
    // properties.add();
    print(properties.length);
    return properties;
  }
}