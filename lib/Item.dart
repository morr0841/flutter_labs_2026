import 'package:floor/floor.dart';

@entity
class Item {
  static int ID = 1; //static class variable for handing out IDs

  Item(this.id, this.quantity, this.name){ //shortform constructor
    if (this.id >= ID){
      ID = this.id + 1;
    }
  }

  @primaryKey
  final int id;

  String name;
  int quantity;

}