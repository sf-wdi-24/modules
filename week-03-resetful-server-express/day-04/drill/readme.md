# IRS Rebate Drill

You've been hired to create a way for the IRS to find people to send rebates to. We have a list of identifiers (fake social security numbers) which will receive a rebate if our software can find them quickly enough to send them rebates. If we take too long to send rebates then everyone will hate the IRS.

Whenever we send a rebate we must check if the person is a thief before we send the rebate otherwise we'll go broke before we send out all the rebates.

We currently have three lists which we use to find people with a rebate and check for thieves.

```js
var allPeople = [
  {
    "guid": "abc123abc123",
    "name": "Person"
  }/, many other people...
];

var thieves = [
  {
    "guid": "abc123abc"
  }
];

var peopleWithRebates = [
  {
    "guid": "abc123"
  }
];
```

## Challenge

Implement the `sendRebate` function which accepts three parameters `allPeople`, `thieves` and `peopleWithRebates`. They are by default an array of people but you may change that.

Starter code is provided [here](https://github.com/sf-wdi-24/irs-rebate) and is executed using `node sendRebate.js`.

1. Try to come up with a solution to the problem, an example solution is provided but doesn't work well enough to be used but can be found [here](https://github.com/sf-wdi-24/irs-rebate/compare/example-solution).

If you can't complete this challenge, it is OK. We'll get together at the end of class and talk over the solution.

## Solution

* [We'll go over in class](https://github.com/sf-wdi-24/irs-rebate/compare/solution)
