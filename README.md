# SECDED ECC Memory with TMR Control

Radiation-aware memory design and verification project:
a (39,32) SECDED-protected memory, scrubbing controller,
and triple-modular-redundant control FSM in SystemVerilog.

## Status

Week 1: Setup and Hamming fundamentals — Days 1–2 complete (Days 3–7 in progress)

## What this project does

- Encodes 32-bit data into a 39-bit SECDED codeword
- Detects and corrects single-bit errors
- Detects double-bit errors without incorrect correction
- Uses a scrubber to prevent single-bit errors from accumulating
- Uses triple modular redundancy for the control FSM

## Repository structure

- `rtl/` — SystemVerilog design files (`counter.sv`)
- `tb/` — SystemVerilog testbenches (`tb_counter.sv`)
- `model/` — Independent Python reference model and tests
- `docs/` — Design notes (`reading_notes.md`), hand calculations (`hamming15_11_worked.pdf`), verification plan, reports
- `sim/` — Simulation scripts and waveform evidence (`counter_waveform.png`)

## Conventions

- **RTL / SystemVerilog:** 0-based bit indexing (e.g., `count[3:0]`, `codeword[38:0]`)
- **Hamming math / docs:** 1-based bit positions (`1..38` for Hamming bits, `p0` for overall parity)

## How to run

### Python reference model

```bash
python model/test_hamming.py
```

### Simulator

Verified on EDA Playground using **Icarus Verilog 12.0** (`-Wall -g2012`):

```bash
iverilog -Wall -g2012 rtl/counter.sv tb/tb_counter.sv -o sim/counter.out
vvp sim/counter.out
```

## Results

### Week 1 — Tool Flow Smoke Test (`counter`)

- **Status:** `SMOKE TEST PASSED` (`$finish` at `446000 ps`)
- **Verified:** Synchronous reset hold, counting `0`–`15`, wraparound, mid-cycle asynchronous reset, and 20-cycle post-reset count (`count == 4`)

```text
VCD info: dumpfile dump.vcd opened for output.
SMOKE TEST PASSED
testbench.sv:110: $finish called at 446000 (1ps)
```

[sim/counter_waveform.png]

### Week 1 — Hand-Worked Hamming & SECDED Notes

- Completed reading notes in `docs/reading_notes.md`
- Worked `(15,11)` extended Hamming (with `p0` overall parity) encoding and single-bit error correction by hand in `docs/hamming15_11_worked.pdf`

## References

See `docs/reading_notes.md`, `docs/hamming15_11_worked.pdf`, and the project reference sheet.
