# 🧠 CPU Scheduling Algorithms Simulator

This C++ program simulates five common **CPU scheduling algorithms** used in operating systems. It supports both **preemptive and non-preemptive** scheduling techniques and calculates key performance metrics such as **waiting time**, **turnaround time**, and **response time**.

---

## ✅ Supported Algorithms

The program implements the following scheduling algorithms:

1. **First-Come First-Served (FCFS)** – Non-Preemptive  
2. **Round Robin (RR)** – Preemptive  
3. **Shortest Job First (SJF)** – Non-Preemptive  
4. **Non-Preemptive Priority Scheduling**  
5. **Preemptive Priority Scheduling**

Each algorithm computes:
- Completion Time
- Turnaround Time
- Waiting Time
- Response Time  

And displays:
- Average Waiting Time  
- Average Turnaround Time  
- Average Response Time  

---

## 🔧 Requirements

To compile and run this program, you'll need:

- A modern **C++ compiler** (supports C++11 or later)
- Terminal / Command Prompt access
- Operating System: **Windows, Linux, or macOS**

---

## 🛠️ How to Compile and Run

### 1. Save the code
Open your text editor or IDE (e.g., Visual Studio Code, Notepad++, Code::Blocks), create a new file , and paste all the contents from your CPU_Scheduling_Algorithims.txt file into it.

Then, save the file as main.cpp in a folder of your choice. This will be the main source file for the CPU scheduling program.

### 2. Compile the code
Open your terminal or command prompt and navigate to the directory where `main.cpp` is located, then run:

```bash
g++ -o scheduler main.cpp 
```

### 3. Run the program
Once compiled, execute the program using:

```bash
./scheduler
```

On Windows, you may need to use:

```bash
scheduler.exe
```

---

## 📥 Input Instructions

Once the program starts:

### 1. Choose an Algorithm
Select from the menu by entering a number between 1 and 6 :

1: FCFS
2: Round Robin
3: SJF
4: Non-Preemptive Priority
5: Preemptive Priority
6: Exit

### 2 Enter Number of Processes
You will be prompted to enter how many processes you want to simulate.

### 3. Provide Process Details
For each process, enter:

• Arrival Time (non-negative integer)
• Burst Time (positive integer)
• (For priority-based algorithms) Priority (lower = higher priority)
• ⚠️ The program validates all inputs:
• Only positive integers for burst time and priority
• Non-negative values for arrival time

### 4. (Round Robin only)
Enter the Time Quantum (time slice allocated to each process per round).

---

## 📤 Output Explanation

After processing, the program shows:

• Process details including:
 • PID
 • Arrival Time
 • Burst Time
 • Completion Time
 • Turnaround Time
 • Waiting Time
 • Response Time

• Performance Statistics:
 • Average Waiting Time (ms)
 • Average Turnaround Time (ms)
 • Average Response Time (ms)

For preemptive algorithms like Round Robin and Preemptive Priority, the program also shows:

• Context switches
• Execution steps over time

---

## 🔁 Repeat or Exit

After each simulation, you'll be asked:

Do you want to continue?
1. Yes
2. No

Choose 1 to go back to the main menu or 2 to exit the program.

---

## 📌 Notes

• All averages are computed as floating-point numbers (double) to ensure accuracy.
• The program handles invalid input gracefully using custom validation functions.
• It uses standard C++ libraries only — no external dependencies.

---

## 💡 Tips

• Use small time quantum values in Round Robin for more context switches.
• Prioritize lower numerical values in Priority Scheduling.
• Try different combinations of processes to compare how each algorithm performs under load.
