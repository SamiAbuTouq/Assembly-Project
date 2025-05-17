# 🌟 GCD and LCM Calculator in Assembly Language 🌟


This project is a **Greatest Common Divisor (GCD)** and **Least Common Multiple (LCM)** calculator implemented in **x86 assembly language**. It features a user-friendly console interface that allows users to input two numbers and computes their GCD and LCM. The program handles edge cases like invalid inputs, zero values, and undefined operations with appropriate feedback.

---

## 🔑 Key Features

- **⚠️ Edge Case Handling**  
  Handles invalid inputs gracefully, including:  
  - Undefined operations (e.g., division by zero).  
  - "Not a Number" (NaN) scenarios.  


- **📊 Dynamic Display**  
  Outputs results in various formats, including:  
  - Valid computation results.  
  - Informative error messages for invalid scenarios.
      

## 📚 How It Works

1. **Input**: The program prompts the user to input two integers.  
2. **Processing**:  
   - Calculates GCD using the Euclidean algorithm. 
   - Computes LCM based on the formula:  
     `LCM(a, b) = |a * b| / GCD(a, b)`  
3. **Output**: Results are displayed in a structured format, or an error message is shown for invalid inputs.

---
