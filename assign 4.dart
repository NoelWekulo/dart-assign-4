import 'dart:io';

// Define a base class
class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print("Animal sound");
  }
}

// Define a subclass that inherits from Animal
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print("$name barks");
  }
}
// Define an interface
abstract class Jumpable {
  void jump();
}

// Implement the interface in a class
class Cat extends Animal implements Jumpable {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print("$name meows");
  }

  @override
  void jump() {
    print("$name jumps");
  }
}


class AnimalInitializer {
  Animal initializeAnimalFromFile(String fileName) {
    // Assume the file contains the name of the animal
    String name = File(fileName).readAsStringSync();
    
    // Assuming file contains "Buddy" for a dog named Buddy
    return Dog(name.trim());
  }
}
void main() {
  // Create an instance of AnimalInitializer
  AnimalInitializer initializer = AnimalInitializer();

  // Initialize animal from file
  Animal animal = initializer.initializeAnimalFromFile("animal_name.txt");

  // Demonstrate the use of loop
  for (int i = 0; i < 3; i++) {
    animal.makeSound();
  }

  // Demonstrate jumping if the animal is a cat
  if (animal is Cat) {
    for (int i = 0; i < 2; i++) {
      (animal as Cat).jump();
    }
  }
}
