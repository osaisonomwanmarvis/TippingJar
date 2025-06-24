# TippingJar.sol
Tipping Jar Smart Contract

---

A simple and transparent Ethereum smart contract for collecting tips with a built-in leaderboard and balance checker. Perfect for content creators, open-source developers, or anyone looking to accept crypto tips with style.

---

Features

• Send ETH tips with personalized messages
• View contract balance
• Track top tippers and their contributions
• Owner-only withdrawal and earnings forwarding


---

Smart Contract Details

Contract Name: TippingJar
Solidity Version: ^0.8.0
License: MIT

The contract keeps a record of each sender’s total tips and latest message, emits an event when tips are received, and forwards the funds to the contract owner.

---

Deployment (via Remix)

1. Open Remix IDE
2. Create a file `TippingJar.sol` and paste in the contract code
3. Compile using the Solidity Compiler
4. Deploy using the “Deploy & Run Transactions” tab


---

Functions

Function	Visibility	Description	
sendTip(message)	public	Send ETH and a message to the contract owner	
getBalance()	view	Returns the current ETH balance of the contract	
getTopTippers(n)	view	Returns top N addresses and their total tips	
getOwner()	view	Returns the address of the contract owner	


---

Example Use

// Send a tip of 0.01 ETH with a message
sendTip("Thanks for your awesome project!") [Payable]

---

Author

Built by: Osaisonomwwan Marvis
Twitter: @0xMaahvis
ETH: 
