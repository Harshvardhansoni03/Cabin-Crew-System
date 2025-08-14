# 🚨 Crew Cabin Lighting Control System — Verilog HDL (Design and development of ASIC for Crew Cabin Lighting)

A fully digital, gate-level lighting control system for aircraft crew cabins using **FSM**, **Verilog**, and **waveform simulation**. This project demonstrates lighting behavior across multiple modes (Normal, Dimming, Emergency) using finite state machines — without using any microcontroller or analog circuitry.

---

## ✨ Project Highlights

- 🔁 Mode-based control using **FSM** (Idle, Normal, Dimming, Emergency)
- 💡 LED blinking behavior simulated using **Verilog + waveform**
- ⚡ Triple Modular Redundancy (TMR) support for **fault tolerance**
- 🔌 Built entirely using **digital logic (no MCU/ADC/PWM ICs)**
- 🧪 Verified using **ModelSim** and **EDA Playground** waveforms

---

## 🔧 Technologies Used

- **Language:** Verilog HDL  
- **Design Style:** Behavioral + RTL  
- **Tools:** EDA Playground, ModelSim, EPWave  
- **Simulation:** `$dumpfile`, `$dumpvars`, testbench with waveform output  

---

### 📊 FSM Lighting Modes

| Mode Code | Mode Name  | Behavior           |
|-----------|------------|--------------------|
| `00`      | IDLE       | All LEDs OFF       |
| `01`      | NORMAL     | LED ON (steady)    |
| `10`      | DIMMING    | LED blinks slowly  |
| `11`      | EMERGENCY  | LED blinks fast    |

---

### 🔁 Finite State Machine (FSM)

- Controlled via `mode_select[1:0]`
- Output based on current state:
  - **NORMAL:** LED stays high
  - **DIMMING:** LED toggles on `counter[3]`
  - **EMERGENCY:** LED toggles on `counter[1]`

---

### 🧩 Circuit and Block Diagram 
![DeWatermark ai_1751571885700](https://github.com/user-attachments/assets/890f3152-0e57-4e25-b66a-c1ef8274ad02)
![DeWatermark ai_1751571885700](https://github.com/user-attachments/assets/40d9a2dc-5daa-41a7-9805-ad10b60f4f61)

---

### 📷 Waveform image:
![Screenshot 2025-07-04 010906](https://github.com/user-attachments/assets/1e7c62f4-1956-469b-9195-cf03739f9429)

- ✅ LED = HIGH in NORMAL mode
- 🔄 LED = toggling slow in DIMMING mode
- 🚨 LED = toggling fast in EMERGENCY mode
- 💤 LED = OFF in IDLE mode
---

## 📬 Contact

For questions, collaboration, or project inquiries: <br>
📧 \[[soniharshvardhan14@gmail.com](mailto:soniharshvardhan14@gmail.com)]<br>
📍 GitHub: [Harshvardhansoni03](https://github.com/Harshvardhansoni03)
