// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <8.10.0;

contract CourseManagement {
    struct Course {
        uint256 id;
        string name;
        address payable ownerAddress;
        uint256 price;
        uint256[] students; // all buyers of a course
        string imgURL;
    }

    //buyer
    struct Student {
        uint256 id;
        string name;
        uint256[] courses; //students owned courses
    }

    //seller
    struct Instructor {
        uint256 id;
        string name;
        uint256[] courses; //instructors uploaded courses
    }
    event courseAdded(string message);
    mapping(uint256 => Course) allCourses;
    mapping(address => Instructor) instructors;
    mapping(address => Student) students;
    address owner;

    //contract owner
    constructor() public {
        owner = msg.sender;
    }

    function buyCourse(uint256 courseID) public payable {
        require(msg.value >= (allCourses[courseID].price));
        allCourses[courseID].ownerAddress.transfer(allCourses[courseID].price);
        students[msg.sender].courses.push(courseID);
    }
}
