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
