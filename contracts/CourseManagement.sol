// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CourseManagement {
    struct Course {
        uint256 id;
        string name;
        address payable ownerAddress;
        uint256 price;
        string imgURL;
    }

    //buyer
    struct Student {
        address id;
        string name;
        uint256[] courses; //students owned courses
    }

    //seller
    struct Instructor {
        address id;
        string name;
        uint256[] courses; //instructors uploaded courses
    }
    event courseAdded(string message);
    event studentAdded(string message);
    event instructorAdded(string message);

    mapping(uint256 => Course) courses;
    mapping(address => Instructor) instructors;
    mapping(address => Student) students;

    uint256 numberofCourses;
    address[] public instructorAccts;
    Course[] public allcourses;
    address[] public studentsAccts;
    address owner;

    // abstract constructor() public {
    //     owner = msg.sender;
    // }

    function addInstructor(
        address _address,
        string memory _fullname,
        uint256[] memory _courses
    ) public {
        instructors[_address] = Instructor({
            id: _address,
            name: _fullname,
            courses: _courses
        });

        instructorAccts.push(_address);
    }

    function addStudent(
        address _address,
        string memory _name,
        uint256[] memory _courses
    ) public {
        students[_address] = Student({
            id: _address,
            name: _name,
            courses: _courses
        });

        studentsAccts.push(_address);
    }

    function addCourse(
        uint256 _id,
        string memory _name,
        string memory _imgURL
    ) public payable returns (Course[] memory) {
        Course storage c = courses[numberofCourses++];
        c.id = _id;
        c.name = _name;
        c.ownerAddress = payable(msg.sender);
        c.price = msg.value;
        c.imgURL = _imgURL;
        allcourses.push(c);
        return allcourses;
    }

    function getInstructorInfos(address _instructor_address)
        public
        view
        returns (
            address,
            string memory,
            uint256[] memory
        )
    {
        address _id = instructors[_instructor_address].id;
        string memory _fullname = instructors[_instructor_address].name;
        uint256[] memory _courses = instructors[_instructor_address].courses;

        return (_id, _fullname, _courses);
    }

    //return Single structure
    function getAnInstructor(address _instructor_address)
        public
        view
        returns (Instructor memory)
    {
        return instructors[_instructor_address];
    }

    //return Array of structure Value
    function getInstructorsInformation()
        public
        view
        returns (address[] memory, string[] memory)
    {
        address[] memory id = new address[](instructorAccts.length);
        string[] memory name = new string[](instructorAccts.length);
        //   uint256[]    memory _courses = new uint256[](instructorAccts.length);
        for (uint256 i = 0; i < instructorAccts.length; i++) {
            id[i] = instructors[instructorAccts[i]].id;
            name[i] = instructors[instructorAccts[i]].name;
            // _courses[i] = instructors[instructorAccts[i]].courses;
        }

        return (id, name);
    }
}
