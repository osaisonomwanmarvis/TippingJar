// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TippingJar {
    address public owner;

    struct TipInfo {
        uint256 totalTipped;
        string latestMessage;
    }

    mapping(address => TipInfo) public tipHistory;
    address[] public tippers;

    constructor() {
        owner = msg.sender;
    }

    event TipReceived(address indexed from, uint256 amount, string message);

    function sendTip(string calldata message) external payable {
        require(msg.value > 0, "Tip must be greater than 0");
        if (tipHistory[msg.sender].totalTipped == 0) {
            tippers.push(msg.sender); // New tipper
        }
        tipHistory[msg.sender].totalTipped += msg.value;
        tipHistory[msg.sender].latestMessage = message;
        emit TipReceived(msg.sender, msg.value, message);
        payable(owner).transfer(msg.value);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getTopTippers(uint256 limit) external view returns (address[] memory, uint256[] memory) {
        uint256 count = tippers.length;
        if (limit > count) limit = count;

        // Create memory arrays
        address[] memory topTippers = new address[](limit);
        uint256[] memory topAmounts = new uint256[](limit);

        // Basic leaderboard logic (unsorted, for simplicity)
        for (uint256 i = 0; i < limit; i++) {
            topTippers[i] = tippers[i];
            topAmounts[i] = tipHistory[tippers[i]].totalTipped;
        }

        return (topTippers, topAmounts);
    }
}


