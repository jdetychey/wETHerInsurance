pragma solidity ^0.4.0;

import "dev.oraclize.it/api.sol";
contract Policy is usingOraclize {
    bytes32 outcome ;
/* we only need an outcome to be tested in the child, location and date will
hard coded at the deployment, the factory and user address aswell
*/
/* Policy() is the constructor, it inherit from the Date of the query to be made
by oraclize and the proper URL 
*/
 function Policy() {
     delay = Date;
/* the proper url is to be determined */
     oraclize_query(delay, "URL", "xml(https://WEATHERAPI_HERE).THE_OUTCOME_TO_BE_TESTED_HERE");
/* the call back give us a result and will resolve by testing if the outcome is the same 
of the result. If that is so, the contract destroys itself and sends its balance back
to the factory, else it destroys itself and sends its balance to the user
*/
 }

 function __callback(string result) {
      if (msg.sender != oraclize_cbAddress()) throw;
      if  (result != outcome) kill(factory);
      kill(user);
 }
 
