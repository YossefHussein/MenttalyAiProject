import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/chart_database/chart_database_state.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ChartDatabaseCubit extends Cubit<ChartDatabaseState> {
  ChartDatabaseCubit() : super(ChartDatabaseInitial());

//   // static final DataBaseHelper instance = DataBaseHelper._();

//   static const _databaseName = 'Sales.db';
//   static const _databaseVersion = 1;

//   Database? _database;

//   /// Define the database name, database version and declare a final property instance of the type DataBaseHelper.
//   /// Also declare a public property named _database, which returns the DataBase instance.
//   /// If _database is not initialized _initDataBase function will be called.
//   /// Define the _initDataBase method as like the below in which the data directory is initialized with getApplicationDocumentsDirectory function,
//   /// which is from path_provider package. This function returns the location where the database is stored,
//   /// which is handled by the path_provider package. To connect and return the database reference openDataBase function is called.
//    initDataBase() async {
//     Directory dataDirectory = await getApplicationDocumentsDirectory();
//     String dbPath = join(dataDirectory.path, _databaseName);
//     return await openDatabase(dbPath,
//         version: _databaseVersion, onCreate: _onCreateDB);
//   }

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDataBase();
//     return _database!;
//   }

//   // If there is no database with the given database path,
//   // we have to create the database. That’s what we have done with onCreate property.
//    Future _onCreateDB(Database db, int version) async {
//     //create table query
//     await db.execute('''
//     CREATE TABLE ${SalesData.tblSales} (
//       ${SalesData.salesXValue} REAL NOT NULL,
//       ${SalesData.salesYValue} REAL NOT NULL
//      )
//   ''');
//   }

//   // the table is created from the above,
//   // so define the methods to add and fetch the data from the SQLite by defining the add(),
//   // getSales() methods as below.

//   // To insert data into the SQLite.
//   void add(SalesData sales) async {
//     var dbClient = await database;
//     // Insert query to insert data into the database
//     await dbClient.insert(SalesData.tblSales, sales.toMap());
//   }

//   // To fetch data from the SQLite.
//   Future<List<SalesData>> getSales() async {
//     var dbClient = await database;
//     List<Map> maps = await dbClient.query(SalesData.tblSales,
//         columns: ['${SalesData.salesXValue}', '${SalesData.salesYValue}']);
//     // Adding the fetched data to the list to bind to the chart.
//     List<SalesData> students = [];
//     if (maps.length > 0) {
//       for (int i = 0; i < maps.length; i++) {
//         students.add(SalesData.fromMap(maps[i] as Map<String, dynamic>));
//       }
//     }
//     return students;
//   }

//   // To delete data from the database table which is in the given id.
//   void delete(int id) async {
//     var dbClient = await database;
//     await dbClient.execute('delete from salestable where xValue = $id');
//   }
}
