// testing my knowledge on smart contracts

pragma solidity ^0.8.7;


contract mycontract{
    address payable owner;
 constructor ()  {

      owner =  payable(msg.sender) ;
 }
mapping(address => students)  map;
 address[]  whitelisted;


struct students{

string name;
uint age;

}
function setMap(address _map) public returns(string memory){
    require(msg.sender == owner,'invalid');
map[_map] = students(
     "me",
    5
);
return(map[_map].name);
}


function addWL(address _wallet)public{
whitelisted.push(_wallet);
}

function showWL() public view returns(address[] memory) {
    return(whitelisted);
}
function recieveMoney() public payable{

}
function getBalance() public view returns(uint) {

uint balance = address(this).balance;
return(balance);
}

function withdrawAll() public {
    require (msg.sender == owner,'you are not permitted');
    owner.transfer(this.getBalance());
}

 function recieve() public payable{
    recieveMoney();
}
function sendCrypto(address payable _address, uint amt) public {
require(msg.sender == owner,'not owner');
_address.transfer(amt);
}
}



contract thecontract{
    address payable owner;
 constructor ()  {

      owner =  payable(msg.sender) ;
 }
mapping(address => uint)  _amtrecieved;
 address[]  whitelisted;


struct students{

string name;
uint age;

}
function setMap() public payable {
_amtrecieved[msg.sender] = msg.value;

}


function addWL(address _wallet)public{
whitelisted.push(_wallet);
}

function showWL() public view returns(address[] memory) {
    return(whitelisted);
}
function recieveMoney() public payable{

}
function getBalance() public view returns(uint) {

uint balance = address(this).balance;
return(balance);
}

function withdrawAll() public {
    require (msg.sender == owner,'you are not permitted');
    owner.transfer(this.getBalance());
}

 function recieve() public payable{
    recieveMoney();
}
function sendCrypto(address payable _address, uint amt) public {
require(msg.sender == owner,'not owner');
assert(amt <= _amtrecieved[msg.sender]);
_address.transfer(amt);
}
}