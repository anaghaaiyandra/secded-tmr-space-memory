# SECDED ECC Memory with TMR Control

Radiation-aware memory design and verification project:
a (39,32) SECDED-protected memory, scrubbing controller,
and triple-modular-redundant control FSM in SystemVerilog.

## Status

Week 1: Setup and Hamming fundamentals — in progress

## What this project does

- Encodes 32-bit data into a 39-bit SECDED codeword
- Detects and corrects single-bit errors
- Detects double-bit errors without incorrect correction
- Uses a scrubber to prevent single-bit errors from accumulating
- Uses triple modular redundancy for the control FSM

## Repository structure

- `rtl/` — SystemVerilog design files
- `tb/` — SystemVerilog testbenches
- `model/` — Independent Python reference model and tests
- `docs/` — Design notes, hand calculations, verification plan, reports
- `sim/` — Simulation scripts and waveform evidence

## How to run

### Python reference model

```bash
python model/test_hamming.py
```

### Simulator

Commands will be added after the simulator workflow is confirmed.

## Results

To be added after tests are complete.

## References

See `docs/reading_notes.md` and the project reference sheet.
