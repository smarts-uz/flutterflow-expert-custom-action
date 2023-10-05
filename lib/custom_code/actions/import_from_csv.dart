// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // Automatic FlutterFlow imports
// import 'dart:convert';
// import '/backend/supabase/supabase.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';

// Future importFromCsv(BuildContext context, String? divider) async {
//   divider = divider ?? ',';
//   final supabse = Supabase.instance;

//   // TODO: Change collection name
//   final collectionRef = supabse.client.from('customers');

//   final selectedFile = await selectFile(allowedExtensions: ['csv']);

//   if (selectedFile != null) {
//     showUploadMessage(
//       context,
//       'Uploading file',
//       showloading: true,
//     );
//   }

//   final fileString = utf8.decode(selectedFile.bytes);

//   List<String> row = [];
//   String fileType = 'csv';
//   Map<String, dynamic> doc = {};

//   if (selectedFile.storagePath.contains('csv')) {
//     rows = fileString.split('\n');

//     for (var row in rows) {
//       i++;
//       if (i == 1) {
//         continue;
//       }

//       List<String> fields = row.split(divider);

//       final docs = await collectionRef.upsert()
//     }
//     showUploadMessage(
//       context,
//       'Success!',
//     );
//   }
// }

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

Future<void> importFromCsv(String filePath) async {
  try {
    final String csvString = await rootBundle.loadString(filePath);
    final List<List<dynamic>> data = await parseCSV(csvString);

    // Assuming your Supabase table is named "your_table_name"
    final response =
        await supabase.from('customers').upsert(data, upsert: true).execute();

    if (response.error != null) {
      throw Exception('Error inserting data: ${response.error}');
    } else {
      print('CSV data inserted successfully');
    }
  } catch (e) {
    print('Error importing CSV: $e');
  }
}
