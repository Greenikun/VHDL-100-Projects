# VHDL 100 Projects: From AND gate to CPUs and SOCs

![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![Synthesizable](https://img.shields.io/badge/Synthesizable-Yes-brightgreen)
![VHDL](https://img.shields.io/badge/Language-VHDL-blue)
![Hardware](https://img.shields.io/badge/Technology-Hardware-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Coverage](https://img.shields.io/badge/Coverage-100%25-brightgreen)
![Self-Tested](https://img.shields.io/badge/Self%20Check%20Testbenches-Yes-red)

Welcome to the **VHDL 100 Projects** repository! This collection presents a structured progression of **VHDL projects**, ranging from basic logic gates to a fully functional **mini CPU and SoC**. Each project is **fully synthesizable** and tested using **ModelSim simulations**, providing both the VHDL source code and accompanying test benches.  

This repository serves as a comprehensive resource for anyone looking to learn or reference **VHDL**, **FPGA design**, or digital system development.


## Project List

### Stage 1 – Combinational Basics (no clock yet)  
*Focus: Boolean logic, concurrent assignments, and basic combinational structures.*

- [ ] 01. AND Gate
- [ ] 02. OR Gate
- [ ] 03. NOT Gate
- [ ] 04. NAND Gate
- [ ] 05. NOR Gate
- [ ] 06. XOR Gate
- [ ] 07. XNOR Gate
- [ ] 08. 2 input multiplexer
- [ ] 09. 4 input multiplexer
- [ ] 10. 8 input multiplexer
- [ ] 11. 1 to 2 demultiplexer
- [ ] 12. 1 to 4 demultiplexer
- [ ] 13. 2 to 4 decoder
- [ ] 14. 3 to 8 decoder
- [ ] 15. Priority Encoder (8 to 3)
- [ ] 16. 7 segment display driver
- [ ] 17. Binary to Gray Code Converter
- [ ] 18. Gray Code to Binary Converter
- [ ] 19. 4 Bit Comparator
- [ ] 20. 8 Bit Comparator
- [ ] 21. Half Adder
- [ ] 22. Full Adder
- [ ] 23. 4 Bit Ripple Carry Adder
- [ ] 24. 4 Bit subtractor
- [ ] 25. 4 Bit adder (selectable with a control signal)
- [ ] 26. Cascadable n-bit Comparator (ongoing)



### Stage 2 – Sequential Basics (introducing clock & processes)  
*Focus: Registers, counters, synchronous reset, and clock enable.*

- [ ] 27. D flip-flop  
- [ ] 28. JK flip-flop  
- [ ] 29. T flip-flop  
- [ ] 30. SR flip-flop  
- [ ] 31. 4-bit register  
- [ ] 32. 8-bit register with load enable  
- [ ] 33. 4-bit shift register (left shift)  
- [ ] 34. 4-bit shift register (right shift)  
- [ ] 35. 4-bit bidirectional shift register  
- [ ] 36. Serial-in serial-out (SISO) shift register  
- [ ] 37. Serial-in parallel-out (SIPO) shift register  
- [ ] 38. Parallel-in serial-out (PISO) shift register  
- [ ] 39. 4-bit synchronous counter (up)  
- [ ] 40. 4-bit synchronous counter (down)  
- [ ] 41. 4-bit up/down counter  
- [ ] 42. Mod-10 counter (BCD counter)  
- [ ] 43. Mod-N counter (parameterized)  
- [ ] 44. Ring counter  
- [ ] 45. Johnson counter  



### Stage 3 – Memory Elements  
*Focus: RAM, ROM, and addressing.*

- [ ] 46. 8x4 ROM (read-only memory)  
- [ ] 47. 16x4 ROM  
- [ ] 48. 8x4 RAM (read/write)  
- [ ] 49. 16x4 RAM  
- [ ] 50. Simple FIFO buffer  
- [ ] 51. Simple LIFO stack  
- [ ] 52. Dual-port RAM  
- [ ] 53. Register file (4 registers × 8 bits)  



### Stage 4 – More Complex Combinational Blocks  
*Focus: Arithmetic, multiplexing, and optimization.*

- [ ] 54. 4-bit carry lookahead adder  
- [ ] 55. 8-bit carry lookahead adder  
- [ ] 56. 4-bit barrel shifter  
- [ ] 57. 8-bit barrel shifter  
- [ ] 58. ALU (Arithmetic Logic Unit) – 4-bit version  
- [ ] 59. ALU – 8-bit version  
- [ ] 60. Floating-point adder (simplified)  
- [ ] 61. Floating-point multiplier (simplified)  
- [ ] 62. Parity generator  
- [ ] 63. Parity checker  
- [ ] 64. Population counter (count the number of 1s in a vector)  
- [ ] 65. Priority multiplexer  



### Stage 5 – State Machines & Control Logic  
*Focus: Finite State Machines, Mealy vs. Moore models, and sequencing.*

- [ ] 66. Simple traffic light controller (3 lights)  
- [ ] 67. Pedestrian crossing traffic light controller  
- [ ] 68. Elevator controller (2 floors)  
- [ ] 69. Elevator controller (4 floors)  
- [ ] 70. Sequence detector (1011)  
- [ ] 71. Sequence detector (1101, overlapping)  
- [ ] 72. Vending machine controller (coin inputs)  
- [ ] 73. Digital lock system (password input)  
- [ ] 74. PWM generator (pulse-width modulation)  
- [ ] 75. Frequency divider  
- [ ] 76. Pulse stretcher  
- [ ] 77. Stopwatch logic  
- [ ] 78. Stopwatch with lap functionality  
- [ ] 79. Reaction timer game logic  



### Stage 6 – Interfaces & Peripherals  
*Focus: Interfacing with external devices.*

- [ ] 80. UART transmitter  
- [ ] 81. UART receiver  
- [ ] 82. UART transceiver (TX + RX)  
- [ ] 83. SPI master  
- [ ] 84. SPI slave  
- [ ] 85. I2C master (simplified)  
- [ ] 86. PS/2 keyboard interface (read keystrokes)  
- [ ] 87. LED matrix driver (8×8)  
- [ ] 88. VGA signal generator (640×480 test pattern)  
- [ ] 89. Digital thermometer reader (simulated sensor input)  



### Stage 7 – Larger Integrated Projects  
*Focus: Combining multiple modules into functional systems.*

- [ ] 90. Digital stopwatch with 7-segment display  
- [ ] 91. Calculator (4-bit inputs, basic operations)  
- [ ] 92. Mini CPU (fetch–decode–execute cycle)  
- [ ] 93. Simple stack-based CPU  
- [ ] 94. 8-bit RISC CPU (register-based)  
- [ ] 95. Basic video game logic (Pong scoreboard)  
- [ ] 96. Audio tone generator (square wave output)  
- [ ] 97. Music player (note sequence generator)  
- [ ] 98. Data acquisition system (sample & store)  
- [ ] 99. FPGA-based clock (with real-time display)  
- [ ] 100. Mini SoC (CPU + RAM + peripherals)  
