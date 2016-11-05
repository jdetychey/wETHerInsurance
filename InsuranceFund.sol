pragma solidity ^0.4.4;

import "dev.oraclize.it/api.sol";
import "Policy.sol";
contract InsuranceFund {


    address factory;
    address user;
    uint commit;
    uint result;
    uint payout;
    function InsuranceFund() {
        factory = this ;    
    }

    function callPolicy(bytes32 longitude, bytes32 latitude, uint date, bytes32 outcome) {
    /* call for the probability and set the payout*/
    /*delay should be 0*/
    /* rejection policy calls with value <1 and >5 */
    if (msg.value < 1) throw;
    if (msg.value >5) throw;
    commit = msg.value;
    user = msg.sender;
    oraclize_query(delay = 0, "URL", "xml(https://WEATHERAPI_HERE).THE_OUTCOME_TO_BE_TESTED_HERE");
    }
    function __callback(string result) {
            if (msg.sender != oraclize_cbAddress()) throw;
            if (result < 0.5) result = 1 - result;
            payout = commit * (1 + result); 
            deploy contract Policy;
            /* we deploy the Policy contract properly constructed with the previously
            defined variables (longitude, latitude, date) for the url of oraclize
            user as address for payout
            the contract is to be deploy with a balance equal to payout
            }*/
            
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
}
