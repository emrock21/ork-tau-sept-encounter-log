// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Ork Tau Sept Encounter Log
/// @notice Records short Ork descriptions of encounters with Tau Septs.
/// @dev Fully safe: no payments, no owner, no external calls, no selfdestruct.

contract OrkTauSeptEncounterLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string sept;       // Tau Sept (T'au, Vior'la, Sa'cea, Dal'yth, Bork'an, Farsight)
        string behavior;   // Short description of how they acted
        string outcome;    // Short description of how the scrap ended
        address creator;   // Who recorded it
        uint256 approved;  // Votes for proppa'
        uint256 rejected;  // Votes for not proppa'
        uint256 createdAt; // Timestamp
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string sept, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                sept: "Example Sept (Fill your own below)",
                behavior: "Describe how da tau acted in da scrap.",
                outcome: "Describe how da fight ended.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata sept,
        string calldata behavior,
        string calldata outcome
    ) external {
        require(bytes(sept).length > 0, "Sept required");

        logs.push(
            Encounter({
                sept: sept,
                behavior: behavior,
                outcome: outcome,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, sept, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
