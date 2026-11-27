# Week 1 Reading Notes

## Sources
- 3Blue1Brown — *Hamming Codes and Error Correction*
- R. W. Hamming (1950) — *Error Detecting and Error Correcting Codes* (Introduction)
- M. Y. Hsiao (1970) — *A Class of Optimal Minimum Odd-weight-column SEC-DED Codes*, IBM Journal of Research and Development 14(4), 395–401

## Key Takeaways
1. **Power-of-2 parity placement:** Parity bits sit at 1-based positions `1, 2, 4, 8, ...` (`2^k`) so each parity bit has only a single `1` in its binary index. That keeps every parity check independent and lets each parity bit cover all positions sharing that bit in their binary index (e.g., `p1` covers `1, 3, 5, 7, ...`).
2. **Syndrome decoding:** Recomputing each parity check (`s1, s2, s4, ...`) yields a binary syndrome equal to the 1-based index of a single-bit error, or `0` when no error is present in the Hamming positions.
3. **Overall parity (`p0`) for SECDED:** Plain Hamming is single-error correcting (SEC) only—two bit flips produce a non-zero syndrome and would be miscorrected. Adding an overall parity bit `p0` (XOR of all Hamming bits, e.g., positions `1..15` in `(16,11)` or `1..38` in `(39,32)`) separates 1-bit errors (`p0` fails, non-zero syndrome), `p0`-only flips (`p0` fails, syndrome `= 0`), and 2-bit errors (`p0` passes, non-zero syndrome).
4. **Triple-bit error limitation:** Three bit flips flip an odd number of bits, so `p0` fails just like a 1-bit error. If the resulting syndrome lands within the valid codeword range (e.g., `1..38` in `(39,32)`), the decoder miscorrects.
5. **Hand-worked `(15,11)` + `p0` check (`docs/hamming15_11_worked.pdf`):** Encoding data `10110100110` gives parity bits `p1=1, p2=1, p4=0, p8=1` and overall parity `p0=1` (even total parity: ten `1`s). Flipping position `11` (`0` → `1`) causes parity checks `i`, `ii`, and `iv` to fail while `iii` passes, pinpointing and restoring position `11`.
6. **Hsiao vs. standard extended Hamming:** Standard extended Hamming adds a separate overall parity bit (`p0`), which creates one wide XOR tree across all bits. Hsiao codes instead use minimum odd-weight columns in the parity-check matrix $H$ with balanced row weights—eliminating the separate `p0` tree, reducing total XOR gates, and equalizing logic depth in hardware.
