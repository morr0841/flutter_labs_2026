
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'ItemDao.dart';
import 'Item.dart';

part 'ItemDatabase.g.dart'; //has to match the file name, not the class name

@Database(version: 1, entities: [Item]) // only one entity per database
abstract class ItemDatabase extends FloorDatabase{

  ItemDao get myDao; //get means this is a read only variable
}