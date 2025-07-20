# CalcMate – All-in-One iOS Calculator App

**CalcMate** is a powerful, lightweight iOS calculator app built using **SwiftUI** with four mini-tools in one app. Designed for productivity, utility, and speed — it features a standard calculator, currency converter, BMI tracker, and age calculator, all under a modern, clean UI with Light/Dark Mode.

---

## Features

### ✅ Standard Calculator
- Supports basic arithmetic: `+`, `-`, `×`, `÷`
- Smart expression evaluation using `NSExpression`
- Undo, Clear, and decimal support
- Maintains history of last 10 calculations

### 💱 Currency Converter
- Fetches real-time currency exchange rates
- Supports background fetching with `DispatchQueue.global`
- Light/dark theme supported

### 🎂 Age Calculator
- Calculates exact age from DOB in years, months, days
- DatePicker based input with instant results

### 📏 BMI Calculator
- Simple BMI calculation based on height & weight
- Shows BMI category (Underweight, Normal, Overweight)

---

## Tech Stack

- **Language**: Swift 5
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Concurrency**: GCD (for background API call)

---

## Folder Structure

Folder Structure 

Views—
              |- SettingsView.Swift
              |- AgeCalculatorView.Swift
              |- BMICalculatorView.Swift
              |- HistoryView.Swift
              |- MainTabView
              |- CurrencyConverterView.Swift
              |- CalculatorView.Swift

Models—
             |-CalculatorModel
             |- CalculationHistory.Swift

Calcmate—
             |- Assets.Swift
             |- CalcMateApp.Swift
             |- ContentView.Swift

ViewModels—
             |- CalculatorViewModel.Swift
             |- CalculationEntry.Swift


---

## How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/CalcMate.git
Open CalcMate.xcodeproj in Xcode (15+ recommended)
Run on any iOS 16+ Simulator or real device
To-Do (Upcoming Features)

 Apple Sign-In
 Share results (BMI, Age) via iMessage
 Localized currency support
 Onboarding screens
 App Icon & Launch screen animation
About the Developer

This app is part of a personal challenge by Sajan Mahla to build 52 iOS apps in 52 weeks and land a job at Apple or in Europe/Canada tech.

License

Free to use, modify and learn. Drop a star ⭐ if this helped you!

