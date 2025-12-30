# 4-Bit ALU with 7-Segment Display

This project implements a 4-bit Arithmetic Logic Unit (ALU) designed for FPGA deployment. It performs common arithmetic and bitwise operations on two 4-bit inputs and visualizes the results on a hexadecimal 7-segment display.

## 🚀 System Overview
The ALU processes two 4-bit inputs (`in0`, `in1`) based on a 2-bit operation selector (`sel_op`). The system is designed with a modular architecture, where each arithmetic and logic function is isolated in its own module for better scalability.

### Key Features
* **4-Function ALU:** Supports Addition, Subtraction, Bitwise AND, and Bitwise OR.
* **Overflow & Borrow Detection:** A dedicated carry-out (`c_out`) signal indicates arithmetic overflows in addition and borrows in subtraction.
* **Hardware Visualization:** Results are decoded into 7-segment patterns (Active-Low) suitable for Common Anode displays.
* **Multiplexed Display Control:** Includes a 2-bit decoder to manage multi-digit anode selection on FPGA boards.

## 🏗️ Architecture
The design uses a structural Top-Level module that interconnects the following components:

1. **Arithmetic Units:** * `sumator.sv`: Performs 4-bit addition with a 5th carry bit.
   * `sub.sv`: Performs 4-bit subtraction with a 5th borrow bit.
2. **Logic Units:** * `poarta_and.sv` & `or_4b.sv`: Execute bitwise operations.
3. **Control Units:**
   * `multiplexor.sv`: Routes the desired result based on the user's selection.
   * `decodor_7seg.sv`: Converts 4-bit hex values into segment patterns.
   * `decodor_2b.sv`: Handles display anode activation.



## 🚦 Operation Table
| sel_op | Operation | Result Logic |
| :--- | :--- | :--- |
| **00** | Bitwise OR | `in0 | in1` |
| **01** | Bitwise AND | `in0 & in1` |
| **10** | Subtraction | `in0 - in1` (Result [3:0]) |
| **11** | Addition | `in0 + in1` (Result [3:0]) |

*Note: The `c_out` LED will light up during Addition if the sum > 15, or during Subtraction if the result is negative (borrow).*

## 🛠️ Hardware Mapping
* **Inputs:** * `in0`, `in1`: 4-bit switches.
  * `sel_op`: 2-bit switches for function selection.
  * `sel_display`: 2-bit switches for digit selection.
* **Outputs:**
  * `decod_7seg`: Cathode pins for the 7-segment display.
  * `decod_2b`: Anode pins (Active-Low).
  * `c_out`: Individual LED for Carry/Borrow.
