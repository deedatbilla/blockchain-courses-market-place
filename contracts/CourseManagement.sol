// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <8.10.0;

contract CourseManagement {
  struct Course {
    uint id;
    string name;
    uint price;
    uint[] students; // all buyers of a course
    string imgURL;
  }

  //buyer
  struct Student {
    uint id;
    string name;
    uint[] courses;
  }

  //seller
  struct Instructor {
    uint id;
    string name;
    uint[] courses;
  }
  event courseAdded(string message);
  mapping(uint => Course) courses;
  mapping(address => Instructor) instructors;
  mapping(address => Student) students;

  constructor() public{
  
    
}
  // function set(uint x) public {
  //   storedData = x;
  // }

  // function get() public view returns (uint) {
  //   return storedData;
  // }
}
