// SPDX-License-Identifier: GPL - 30
pragma solidity >= 0.7.0 < 0.9.0;

contract A{

    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age){
        name = _name;
        age = _age;
    }
    function change(string memory _name, uint256 _age)public  {
        name = _name;
        age = _age;
    }


}

contract B{
    A instance_a = new A("Tanay", 18);

    function get() public view returns(string memory, uint256){
        return(instance_a.name(), instance_a.age());
    }

    function change(string memory _name, uint256 _age)public{
        instance_a.change(_name, _age);
    }
}

