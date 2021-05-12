import 'package:food_app/domain/database/database.dart';

class DbRepository extends AppDatabase {

  DbRepository._privateConstructor();
  static final DbRepository _instance = DbRepository._privateConstructor();
  static DbRepository get instance {
    return _instance;
  }

  Future<List<Food>> getAllFoods() => select(foods).get();
  Future insertFood(Food food) => into(foods).insert(food);
  Future deleteFood(Food food) => delete(foods).delete(food);
}