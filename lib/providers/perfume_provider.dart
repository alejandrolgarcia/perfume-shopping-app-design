import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:tarea_edutec/models/perfume_model.dart';

class PerfumeProvider {

  Future<Result> loadData () async {

    final resp = await rootBundle.loadString('data/perfumes.json');
    return Result.fromJson(json.decode(resp));
  
  }

}