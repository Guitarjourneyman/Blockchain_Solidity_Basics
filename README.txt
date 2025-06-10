## Smart Contract: The rule how to operate cryptocurrency 
e.g. Give money every a multiple of three

# Introduction
* No Print function in solidity - Use log instead
Comment below
* solidity license - // SPDX-License-Identifier: GPL - 30
* solidity version - e.g pragma solidity >= 0.7.0 < 0.9.0;
** Must end up with semicolone

How to define contract?
- contract Helllo{}

How to make an instance of a contact => same as java,C#
A variable doesn't depend on its instance's changes
constructor: intinitalizes variables when generalize an instance
However, due to limited gas, we can't use the function infinitely.
GAS (dependent on how long smart contract)
1 ether = 10^18 wei = 10^9 Gwei 
whenever to deploy smart contract, gas is used. The thing is how to deal with as less as possible

# Function
fuction NAME(PARAMETER) public { //CONTEXT}
fuction NAME(PARAMETER) public returns (RETURNED TYPE){ //CONTEXT}
public: anywhere
external: contract anywhere except where defined
private: contract only where defined
internal: contract where defined and inherited 
view: it make variables out of a function readable but non editable
pure: when a function doesn't use variables out of the fucntion.
Nothing(not defined view nor pure): when a function uses variables out of the function but has to change its value

e.g. function setAgeList(uint256 index, uint256 age) public{ageList[_index] = age;}
e.g. function getAge(uint256 index, uint256 age) public {return ageList[_index];}

# Data Management
Storage: most of variables, function permanently saved here. more data need more gas
Memory: parameters, return value, type of reference saved here temporarily. Less gas used than a storage
Colldata: used to parameters of external function
stack: manages stack data by EVM limited 1024MB
* String type should be defined followed by 'memory'


# Data Strcuture
Mapping: key-value
mapping(uint256=>uint256) private ageList;
매핑(키=>벨류) 가시성 이름;
 

# Inheritence
e.g. contract 상속 수신자 is 상속 송신자: The contract handed over can use the parents' functions without redefinition.

# Overriding
'virtual' from the original function
'override' from the overrode function
when a cotranct wants to get inheritant by more than two,
e.g. contract Son is Father,Mother{}
However, they have common function, child contract must override # fuction getMoney() public view override(부모1,부모2 또는 부모1){}
