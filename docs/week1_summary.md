# Week 1 Reading Notes

## Sources
- 3Blue1Brown — *Hamming Codes and Error Correction*
- R. W. Hamming (1950) — *Error Detecting and Error Correcting Codes* (Introduction)
- MIT 18.200 — *Lecture 19: Error-Correcting Codes*

## Key Takeaways (5-Line Summary)
1. **Power-of-2 parity placement:** <Why parity bits sit at 1, 2, 4, 8... and which positions each checks>
2. **Syndrome decoding:** <How recomputing parity bits forms a binary number pointing to the flipped bit>
3. **Overall parity (`p0`) for SECDED:** <Why SEC alone isn't enough for 2-bit errors, and how `p0` distinguishes 1-bit vs. 2-bit errors>
4. **Limitation (3+ bit errors):** <Why 3+ flips can alias into a valid-looking syndrome>
5. **Hand-worked Hamming(7,4) check:** <One sentence on your worked example and the bit flip you corrected>
