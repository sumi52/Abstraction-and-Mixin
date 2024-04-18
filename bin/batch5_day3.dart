import 'package:batch5_day3/batch5_day3.dart' as batch5_day3;

void main(){
  final  seip = SeipStudent(stipend: 9000, name: 'ABC', courseName: 'Android'); //Student likhle o hobe,etao seip parent er type
  final  paid = PaidStudent(courseFee: 6000, name: 'DEF', courseName: 'Flutter');
  final paidIntern = PaidInternStudent(salary: 2500, name: 'aaa', courseName: 'Graphics', courseFee: 5000);

  List<Student>studentList = [seip, paid, paidIntern]; //eta hocche ekta collection
  for(var student in studentList){
    print(student.getInfo());
  }
  print(paid.txAmount);
}
abstract class Student {
  String name;
  String courseName;
  Student({required this.name, required this.courseName});
  String getInfo ();

}
class SeipStudent extends Student {
  double stipend;

  SeipStudent({required this.stipend,
    required String name,
    required String courseName}) : super(name: name, courseName: courseName);
  @override
  String getInfo() => '$name $courseName $stipend';

}
class PaidStudent extends Student with FoodAllowance, TransportAllowance {

  double courseFee;
  @override
  double amount = 50;

  PaidStudent({required this.courseFee, required String name, required String courseName}) :
        super(name: name, courseName: courseName);

  @override
  String getInfo() => '$name $courseName $courseFee';

}
class PaidInternStudent extends PaidStudent{
  double salary = 2500;

  PaidInternStudent({required this.salary, required String name, required String courseName, required double courseFee}):
        super(name: name, courseName: courseName, courseFee: courseFee);
}
class FoodAllowance{
  double foodAmount =50;

  void something(){

  }
}
class TransportAllowance{
  double txAmount = 100;
}
