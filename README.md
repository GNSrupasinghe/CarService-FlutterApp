# 🚗 CarService Mobile App

CarService is a mobile application built using **Flutter** and **Firebase** that allows users to easily book car maintenance services from their mobile devices. With a user-friendly interface, customers can select their car, choose the desired service, and schedule an appointment at their convenience.

---

## 📱 Features

- 🔍 **Car Selection**  
  Users can browse and select their registered vehicles.

- 🛠️ **Service Selection**  
  Multiple car services are available (e.g., Oil Change, Tire Rotation, Full Inspection, etc.).

- 📅 **Service Scheduling**  
  Users can choose a convenient date and time to book a service appointment.

- 🔔 **Notifications (Coming Soon)**  
  Get reminders for upcoming service schedules.

- 🧾 **Booking History (Planned)**  
  View past and upcoming service bookings.

---

## 🧰 Tech Stack

- **Flutter** – Frontend development  
- **Firebase** – Backend as a Service
  - Firebase Authentication (for user login/signup)
  - Firestore (for storing bookings, cars, and services)
  - Firebase Cloud Functions *(optional for automation)*
  - Firebase Notifications *(future enhancement)*

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Firebase account with a configured project
- Android Studio / VS Code with Flutter support

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/carservice-app.git
   cd carservice-app
2. **Connect to Firebase**

Create a new Firebase project
Add Android/iOS app
Download google-services.json (for Android) or GoogleService-Info.plist (for iOS)
Place the config files in respective directories
Enable Firebase Authentication & Firestore

3. **Run the app**
   ```bash
   flutter run

