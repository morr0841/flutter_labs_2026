import 'package:floor/floor.dart';
import 'Item.dart';

@dao
abstract class ItemDao{
//make all functions asynchronous

  @Query('SELECT * FROM Item')
  Future< List<Item> > getAllItems();

  @insert // will generate the insert SQL
  Future<void> insertItem(Item i);

  @delete
  Future<void> deleteItem(Item i);

  @update
  Future<void> updateItem(Item i);
}