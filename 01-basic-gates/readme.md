# 01 Basic Gates

In this guide, the following is covered:

1. Basic VHDL skeleton.
    1. The standard library.
    1. The difference between entity and architecture.
1. Different ways to model the architecture in VHDL (structural, dataflow, behavioral, or a mix of them).
1. Primitive gates you could use for a structural model (gate level).

---
## 1. - Basic VHDL Skeleton

In a very basic VHDL code, there are always going to be three things present: the library declaration, the entity of the hardware being designed, and the architecture of that hardware.

### 1.1. The Standard Library 
Documentation in progress...

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
```