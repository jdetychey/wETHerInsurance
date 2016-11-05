## The Situation of the crop grower

We consider a crop grower that expect an event with probability p, if this event occur he will have 0 and if it does not occur he will have 100. This amount can be set to anything, I pick 100 so has not to have too much abstraction.

He has an expected value of:

    E = p * 0 + (1 - p) * 100 

The payout of the contract should give a payout that reproduce this expected value minus a fee.

## How much should the insurance found send?

We denote **x** the value that the farmer commit to the contract and **y** the value that the Insurance found will commit.

If the event occur the crop grower will receive:
 
    x * (1 + y) 

Otherwise he will have 100 minus the **x** he commit

The expect value become:

    E' = p * x * (1 + y) + (1 - p) * ( 100 - x) 

Solving: 

    E = E'

Leads to:


    y = -2 + 1 / p

 
with the plot:

http://pasteboard.co/nBVw3TWki.png

Therefore as long as the **y** follows this rule the expected utility will be the same for the crop grower whether (*or shall I say wETHer*) he chooses to take a contract or not. This whole system  is independent of the value comited **x**. In order to avoid having to much value at risk in a single contract we will set a condition on **x**

    1 =< x =< 5

also a **fee** can be implemented inside or outside **y** to cover for gas and oraclize cost. The **fee** can also be set so as to provide a revenue to the insurance fund.

**Note: we exclude any probability over 50% as it would lead to a negative y**.




Example:


Let's consider:

    x = 10
    p = 10%
    fee = 0.1


Without a contract the expected value is

    E = 10% * 0 + 90% * 100 = 90

If the event occur and the crop grower is insured he will get from the contract (without fee):

    x * ( 1 + y ) = 10 * (1 - 2 + 1/(10%)) =  90

if there is a fee:

    x * ( 1 + y ) = 10 * (1 - 2 + 1/(10%) - 0.1 ) =  89

After the contract his expected value is:

    E'= 10% * 89 + 90% * (100 - 10) = 89,9

**Insurance is cool :- )))))**
