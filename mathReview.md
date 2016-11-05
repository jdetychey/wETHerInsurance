
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



2. Click 'HTML Preview' button.

----
## markdown quick reference
# headers

*emphasis*

**strong**

* list

>block quote

    code (4 spaces indent)
[links](http://wikipedia.org)

----
## changelog
* 17-Feb-2013 re-design

----
## thanks
* [markdown-js](https://github.com/evilstreak/markdown-js)
