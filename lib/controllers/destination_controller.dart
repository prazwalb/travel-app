import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/data.dart';
import 'package:flutter_project/widget/bestDestination.dart';
import 'package:http/http.dart' as http;

class DestinationController extends ChangeNotifier {
  final List<Bestdestination> _destination = [];

  List<Bestdestination> get destination => _destination;

  void addDestination(Bestdestination destination) {
    _destination.add(destination);
    notifyListeners();
  }

  Future<void> getDestination() async {
    final res = await http
        .get(Uri.parse('http://192.168.1.101:8080/popular-destinations'));
    final datadecode = jsonDecode(res.body);
    List<Bestdestination> data = [];
    for (var i = 0; i < datadecode.length; i++) {
      data.add(Bestdestination.fromJson(datadecode[i]));
    }
    debugPrint(data.length.toString());
    _destination.clear();
    _destination.addAll(data);
    notifyListeners();
  }

  Future<void> deleteDestination(String destinationId) async {
    final res = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$destinationId'));
    if (res.statusCode == 200) {
      _destination.removeWhere((e) => e.id == destinationId);
      notifyListeners();
    }
  }
}
