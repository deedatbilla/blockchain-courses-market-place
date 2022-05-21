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
    uint[] courses; //students owned courses
  }

  //seller
  struct Instructor {
    uint id;
    string name;
    uint[] courses; //instructors uploaded courses
  }
  event courseAdded(string message);
  mapping(uint => Course) courses;
  mapping(address  => Instructor)  instructors;
  mapping(address => Student)  students;

  address[] public instructorAccts;
  uint[] public allcourses;
  address[] public studentsAccts;

  constructor() public{
  
    
}


 
}
