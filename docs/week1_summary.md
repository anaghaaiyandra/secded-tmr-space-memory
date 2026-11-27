# Week 1 Progress Summary

## Completed
- [x] **Day 1 — Repo & Simulator Flow:** Created `secded-tmr-space-memory` with `rtl/`, `tb/`, `model/`, `docs/`, `sim/`; simulated `rtl/counter.sv` + `tb/tb_counter.sv` on EDA Playground (`iverilog -Wall -g2012`), passed `SMOKE TEST PASSED` (`446000 ps`), and saved `sim/counter_waveform.png`.
- [x] **Day 2 — Hamming Fundamentals:** Studied Hamming codes (3Blue1Brown / MIT 18.200), wrote `docs/reading_notes.md`, and worked a full `(15,11)` + `p0` SECDED encode/decode example by hand in `docs/hamming15_11_worked.pdf`.

## Next Up
- [ ] **Day 3:** Create `docs/hamming_map.md` for the `(39,32)` layout, syndrome decision table, and one hand-worked 32-bit word.
- [ ] **Day 4:** Build `model/hamming.py` (`encode`, `decode`, single/double/triple-bit flip tests).
- [ ] **Day 5:** Draft `docs/verification_plan.md` and generate `vectors.hex`.
- [ ] **Day 6 (Stretch):** Write `rtl/ecc_encoder.sv` and verify against `vectors.hex`.
- [ ] **Day 7:** Complete the Section 7 quiz from memory and finalize Week 1 commits.
