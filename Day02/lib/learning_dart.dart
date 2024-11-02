import 'dart:core';

void main(){

  Car car = Car(spreed: '130', wheel: '3');

  car.displySomething();

}

class Car{
  late String wheel;
  late String spreed;

  Car({required this.spreed , required this.wheel});
  void displySomething(){
    print(wheel + spreed);
  }


}