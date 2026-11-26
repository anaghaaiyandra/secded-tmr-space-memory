# Week 1 Reading Notes

## Sources
- 3Blue1Brown — *Hamming Codes and Error Correction*
- R. W. Hamming (1950) — *Error Detecting and Error Correcting Codes* (Introduction)
- MIT 18.200 — *Lecture 19: Error-Correcting Codes*

## Key Takeaways
1. **Power-of-2 parity placement:** Parity bits sit at positions `1, 2, 4, 8, ...` (`2^k`) so each parity bit independently covers one bit of the binary position index (e.g., `p1` checks positions with bit 0 set: `1, 3, 5, 7...`).
2. **Syndrome decoding:** Recomputing each parity check (`s1, s2, s4, ...`) gives a binary syndrome that directly equals the 1-based position of a single-bit flip, or `0` when there is no error.
3. **Overall parity (`p0`) for SECDED:** Plain Hamming is single-error correcting (SEC) only—two bit flips create a non-zero syndrome and get miscorrected. Adding `p0` (XOR of all 38 Hamming bits) separates 1-bit errors (`p0` check fails) from 2-bit errors (`p0` check passes with non-zero syndrome).
4. **Triple-bit error limitation:** Three bit flips cause `p0` to fail just like a 1-bit error, so if the syndrome lands in `1..38`, the decoder will miscorrect.
5. **Hand-worked Hamming(7,4) check:** With data `1011`, the codeword is `0110011` (positions `1..7`). Flipping position `5` (`0110111`) gives syndrome `s4 s2 s1 = 101` (`5`), identifying and restoring bit 5.
