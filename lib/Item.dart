import 'package:floor/floor.dart';

@entity
class Item {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String name;
  int quantity;

  Item(this.id, this.quantity, this.name){ //shortform constructor
    }
}