# xv6-projectt

This project is based on the **xv6-riscv** teaching operating system.  
It includes experiments and modifications for learning **Operating Systems Principles**.

---

## 🔹 Features Implemented
- Modifications to process management (`proc.c`, `proc.h`)  
- Experiments with scheduling policies and metrics  
- Custom system call implementations  
- Exploration of xv6 internals (process table, traps, memory management)

---

## 🔹 Requirements
- Linux or macOS (or WSL on Windows)  
- [QEMU](https://www.qemu.org/) with RISC-V support  
- `make`, `gcc`, and standard development tools  

---

## 🔹 Build & Run
Clone and build:

```bash
git clone https://github.com/setaahp/xv6-projectt.git
cd xv6-projectt
make
make qemu
```

---

## 🔹 Repository Structure
.
├── kernel/         # Kernel source (proc, vm, trap, sys, etc.)
├── user/           # User-space programs
├── Makefile        # Build rules
├── *.h, *.c        # Core kernel files (proc.h, param.h, etc.)
└── README.md

---

## 🔹 Acknowledgments

- MIT xv6 Book (RISC-V)
- xv6 original source from MIT PDOS group

---

## 🔹 License
This project is for educational purposes only.
The original xv6 code is under MIT license (see xv6 distribution).



