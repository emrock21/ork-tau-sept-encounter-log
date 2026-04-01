# Ork Tau Sept Encounter Log

An on-chain ledger of Ork descriptions of encounters with the Tau Septs.  
Each entry uses a short 3‑line format describing how the Sept acted and  
how the scrap ended. The community votes whether the encounter was  
**WAAAGH-approved** or **not proppa'.**

---

## Contract

Deployed on Base:  
`0xaedd95a0bbe7dad41d235b26830c28bd6b89a41e`  
https://basescan.org/address/0xaedd95a0bbe7dad41d235b26830c28bd6b89a41e#code

Main file: `contracts/OrkTauSeptEncounterLog.sol`

---

## How it works

Each entry stores:

- `sept` – Tau Sept (T'au, Vior'la, Sa'cea, Dal'yth, Bork'an, Farsight)  
- `behavior` – Short description of how they acted  
- `outcome` – Short description of how the fight ended  
- `approved` / `rejected` – Community votes  

Entry **0** is a built-in example.

---

## Example encounter

```solidity
recordEncounter(
  "Vior'la Sept",
  "Da tau moved fast an' kept firin' while shiftin' lines.",
  "Da scrap ended wiv smoke an' scorch marks everywhere."
);

Voting
voteEncounter(1, true);   // WAAAGH-approved
voteEncounter(1, false);  // Not proppa'

Closing Note
A concise, brutal chronicle of Tau Sept clashes —
the ones that stood their ground, and the ones that slipped away
before da WAAAGH got loud.
