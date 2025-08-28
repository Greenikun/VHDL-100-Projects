# VHDL 100 Projects 

This repository is a **progressive roadmap of 100 VHDL projects**, starting from simple logic gates up to designing a **mini CPU and SoC**.  

The projects are divided into **7 stages**, each focusing on a new concept (combinational, sequential, memory, arithmetic, state machines, interfaces, and integration).  
The goal: **learn VHDL by building**, one step at a time.  

##  Project Roadmap

### Stage 1 – Combinational Basics (no clock yet)
Focus: Boolean logic, concurrent assignments, with `select`, `when`, `generate`.

- [x] [AND gate](https://github.com/TheChipMaker/100_AND_GATE).
- [x] [OR gate](https://github.com/TheChipMaker/99_OR_GATE).
- [x] [NOT gate](https://github.com/TheChipMaker/98_NOT_GATE).
- [x] [NAND gate](https://github.com/TheChipMaker/97_NAND_GATE).
- [x] [NOR gate](https://github.com/TheChipMaker/96_NOR_GATE).
- [x] [XOR gate](https://github.com/TheChipMaker/95_XOR_GATE).
- [x] [XNOR gate](https://github.com/TheChipMaker/94_XNOR_GATE).
- [x] [2-input multiplexer (2:1 MUX)](https://github.com/TheChipMaker/93_2to1_MUX).
- [x] [4-input multiplexer (4:1 MUX)](https://github.com/TheChipMaker/92_4to1_MUX).
- [x] [8-input multiplexer (8:1 MUX)](https://github.com/TheChipMaker/91_8to1_MUX).
- [x] [1-to-2 demultiplexer](https://github.com/TheChipMaker/90_1to2_deMUX).
- [x] [1-to-4 demultiplexer](https://github.com/TheChipMaker/89_1to4_deMUX).
- [x] [2-to-4 decoder](https://github.com/TheChipMaker/88_Decoder2to4).
- [ ] 3-to-8 decoder  
- [ ] Priority encoder (4-to-2)  
- [ ] 7-segment display driver (for 0–9)  
- [ ] Binary to Gray code converter  
- [ ] Gray code to binary converter  
- [ ] 4-bit comparator  
- [ ] 8-bit comparator  
- [ ] Half adder  
- [ ] Full adder  
- [ ] 4-bit ripple carry adder  
- [ ] 4-bit subtractor  
- [ ] 4-bit adder-subtractor (control signal)  
- [ ] 4-bit magnitude comparator  



### Stage 2 – Sequential Basics (introduce clock & processes)
Focus: Registers, counters, synchronous reset, clock enable.

- [ ] D flip-flop  
- [ ] JK flip-flop  
- [ ] T flip-flop  
- [ ] SR flip-flop  
- [ ] 4-bit register  
- [ ] 8-bit register with load enable  
- [ ] 4-bit shift register (left shift)  
- [ ] 4-bit shift register (right shift)  
- [ ] 4-bit bidirectional shift register  
- [ ] Serial-in serial-out (SISO) shift register  
- [ ] Serial-in parallel-out (SIPO) shift register  
- [ ] Parallel-in serial-out (PISO) shift register  
- [ ] 4-bit synchronous counter (up)  
- [ ] 4-bit synchronous counter (down)  
- [ ] 4-bit up/down counter  
- [ ] Mod-10 counter (BCD counter)  
- [ ] Mod-N counter (parameterized)  
- [ ] Ring counter  
- [ ] Johnson counter  



### Stage 3 – Memory Elements
Focus: RAM, ROM, addressing.

- [ ] 8x4 ROM  
- [ ] 16x4 ROM  
- [ ] 8x4 RAM (write/read)  
- [ ] 16x4 RAM  
- [ ] Simple FIFO buffer  
- [ ] Simple LIFO stack  
- [ ] Dual-port RAM  
- [ ] Register file (4x8 bits)  


### Stage 4 – More Complex Combinational Blocks
Focus: Arithmetic, multiplexing, optimization.

- [ ] 4-bit carry lookahead adder  
- [ ] 8-bit carry lookahead adder  
- [ ] 4-bit barrel shifter  
- [ ] 8-bit barrel shifter  
- [ ] ALU – 4-bit  
- [ ] ALU – 8-bit  
- [ ] Floating-point adder (simplified)  
- [ ] Floating-point multiplier (simplified)  
- [ ] Parity generator  
- [ ] Parity checker  
- [ ] Population counter (count 1s)  
- [ ] Priority multiplexer  



### Stage 5 – State Machines & Control Logic
Focus: FSMs, Mealy vs. Moore, sequencing.

- [ ] Simple traffic light controller (3 lights)  
- [ ] Pedestrian crossing traffic light controller  
- [ ] Elevator controller (2 floors)  
- [ ] Elevator controller (4 floors)  
- [ ] Sequence detector (1011)  
- [ ] Sequence detector (1101, overlapping)  
- [ ] Vending machine controller (coin inputs)  
- [ ] Digital lock system (password input)  
- [ ] PWM generator  
- [ ] Frequency divider  
- [ ] Pulse stretcher  
- [ ] Stopwatch logic  
- [ ] Stopwatch with lap functionality  
- [ ] Reaction timer game logic  



### Stage 6 – Interfaces & Realistic Modules
Focus: Interfacing with peripherals.

- [ ] UART transmitter  
- [ ] UART receiver  
- [ ] UART transceiver (TX+RX)  
- [ ] SPI master  
- [ ] SPI slave  
- [ ] I2C master (simplified)  
- [ ] PS/2 keyboard interface  
- [ ] LED matrix driver (8x8)  
- [ ] VGA signal generator (640x480)  
- [ ] Digital thermometer reader (simulated input)  



### Stage 7 – Larger Integrated Projects
Focus: Combining many modules.

- [ ] Digital stopwatch with 7-segment display  
- [ ] Calculator (4-bit inputs, basic ops)  
- [ ] Mini CPU (fetch–decode–execute)  
- [ ] Simple stack-based CPU  
- [ ] 8-bit RISC CPU  
- [ ] Basic video game logic (Pong scoreboard)  
- [ ] Audio tone generator (square wave)  
- [ ] Music player (note sequence generator)  
- [ ] Data acquisition system (sample + store)  
- [ ] FPGA-based clock (real-time display)  
- [ ] Mini SoC (CPU + RAM + peripherals)  


