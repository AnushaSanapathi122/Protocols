
# Ready–Valid Handshake Protocol (Verilog)

## Overview

This project implements the **Ready–Valid handshake protocol** using Verilog HDL.

The Ready–Valid protocol is a synchronous flow-control mechanism used to safely transfer data between a sender (producer) and a receiver (consumer).
Backpressure is a mechanism where the receiver tells the sender to slow down or stop sending data.

Data transfer occurs only when:

```
valid && ready
```


## What is Ready–Valid Protocol?

Ready–Valid is a handshake mechanism used in hardware to control data flow between two modules.

### How it works:

* The **sender** asserts `valid = 1` when it has data.
* The **receiver** asserts `ready = 1` when it can accept data.
* Data transfer happens only when both signals are HIGH at the clock edge.

This prevents:

* Data loss
* Overflow
* Corruption
* Timing issues


## Signals

* `valid` → Controlled by sender (data available)
* `ready` → Controlled by receiver (can accept data)
* `data`  → Payload being transferred


## Transfer Logic

In this implementation, data increments only when a successful transfer occurs:

```verilog
if (valid && ready)
    data <= data + 1;
```

This ensures:

* Data changes only on successful handshake
* Data remains stable if receiver is not ready
* Easy verification in waveform


## Design Block Diagram

<img width="1541" height="812" alt="Screenshot 2026-02-23 113724" src="https://github.com/user-attachments/assets/43670610-e5aa-4dc8-b80f-85e1c06d4bb7" />


## Simulation Waveform

<img width="1549" height="756" alt="Screenshot 2026-02-23 123235" src="https://github.com/user-attachments/assets/1bd57829-19ae-43ad-a23a-7a0e6a9299b8" />


### Waveform Explanation

* `valid` becomes HIGH when sender has data.
* `ready` changes depending on receiver availability.
* `data` increments only when `valid && ready = 1`, i.e, sender ready to send data and receiver ready to accept data
* When `ready = 0`, data remains stable (backpressure).


## Simulation Steps (Vivado)

1. Add all RTL files.
2. Set `tb_top` as simulation top.
3. Run Behavioral Simulation.
4. Add `valid`, `ready`, and `data` to waveform.


## Learning Outcome

* Understanding handshake-based data transfer
* Flow control and backpressure concept
* Synchronous RTL design
* Waveform-based protocol verification


