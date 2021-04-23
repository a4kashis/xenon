import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imei_plugin/imei_plugin.dart';

Uri loginApiUrl = Uri.parse('https://cgdemoprojects.com/babysit_cg/auth/login');
Uri registerApiUrl =
    Uri.parse('https://cgdemoprojects.com/babysit_cg/auth/user_registration');

final Map<String, String> headers = {'Content-Type': 'application/json'};

// void showInSnackBar(String value, context) {
//   Scaffold.of(context)
//   .
// }

class Services {
  Future login(String mobile) async {
    String imei =
        await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);

    final params = json.encode({'mobile_no': mobile, 'imei_no': imei});
    final registerUser =
        await http.post(loginApiUrl, headers: headers, body: params);
    Map<String, dynamic> data;
    if (registerUser.statusCode == 200) {
      data = json.decode(registerUser.body);
      print('data$data');
      return data;
    } else {
      print(registerUser.body);
      return json.decode(registerUser.body);
    }
  }

  registerUser(String parent, String email, String mobile, String child,
      String relation) async {
    String imei =
        await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
    print(imei);
    final params = json.encode({
      "parentname": parent,
      "email_id": email,
      "mobile_no": mobile,
      "imei_no": imei,
      "no_of_children": child,
      "relation": relation
    });

    print(params);
    final registerUser =
        await http.post(registerApiUrl, headers: headers, body: params);

    Map<String, dynamic> data;
    if (registerUser.statusCode == 200) {
      data = json.decode(registerUser.body);
      print('data$data');
      return data;
    } else {
      print(registerUser.body);
      return json.decode(registerUser.body);
    }
  }
}
