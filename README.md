# Riser

**Riser** is a mobile application designed to enhance family relationships through shared affirmations. Built using FlutterFlow and powered by Firebase, it provides an intuitive and secure platform for families to stay connected, motivated, and inspired.

> _"Building a stronger family bond, one affirmation at a time."_

---

## 📖 **Table of Contents**

- [Riser](#riser)
  - [📖 **Table of Contents**](#-table-of-contents)
  - [📝 **Overview**](#-overview)
  - [🌟 **Key Features**](#-key-features)
  - [⚙️ **Installation**](#️-installation)
    - [**Prerequisites**](#prerequisites)
    - [**Steps**](#steps)
  - [🛠️ **Usage**](#️-usage)
  - [🏗️ **Project Architecture**](#️-project-architecture)
  - [📦 **Core Packages**](#-core-packages)
  - [⚡ **Performance Optimization**](#-performance-optimization)
  - [🔒 **Security Measures**](#-security-measures)
  - [🤝 **Contributing**](#-contributing)
  - [⚠️ **Known Limitations and Future Enhancements**](#️-known-limitations-and-future-enhancements)
  - [📜 **License**](#-license)
  - [📬 **Contact**](#-contact)
  - [📚 **Additional Resources**](#-additional-resources)

---

## 📝 **Overview**

Riser leverages modern app development technologies like Flutter and Firebase to provide an engaging platform where families can:
- Share daily affirmations.
- Track progress using gamified elements.
- Stay connected with notifications and reminders.

The app focuses on fostering positivity and connection, making it suitable for users of all technical backgrounds.

---

## 🌟 **Key Features**

1. **User Authentication**:
   - Supports Google Sign-In for fast and secure account access.
   - Stores session data locally using Flutter Secure Storage.

2. **Affirmation Management**:
   - Users can create, edit, and manage affirmations in real time via Firestore.
   - Audio affirmations are recorded on the device and uploaded to Firebase Storage.

3. **Family Groups**:
   - Allows users to form family groups through email invitations or unique group codes.
   - Backend ensures secure storage and management of group data.

4. **Daily Reminders**:
   - Push notifications are delivered via Firebase Cloud Messaging to prompt users to engage with their affirmations.

5. **Gamification and Progress Tracking**:
   - Tracks user activity, awarding streaks and milestones that are stored in Firestore.
   - Badges and achievements are dynamically updated in the user profile.

6. **Offline Mode**:
   - Uses Sqflite for local data storage, ensuring core features remain accessible without internet connectivity.
   - Synchronizes data with Firestore when connectivity is restored.

7. **Media Integration**:
   - Users can upload profile or affirmation-related images using the Image Picker package.
   - Audio recording integrates directly with device APIs for seamless functionality.

8. **External Resources**:
   - Provides quick access to external articles or resources via the URL Launcher package.

---

## ⚙️ **Installation**

### **Prerequisites**

To run Riser, you’ll need:
- A compatible Android/iOS device or emulator.
- [Flutter](https://flutter.dev/docs/get-started/install) installed on your development environment.
- Firebase project configuration files (refer to the [Firebase Documentation](https://firebase.google.com/docs)).

### **Steps**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Xpress-Digital/Riser.git
   cd Riser
   ```

2. **Install Dependencies**:
   Run the following command to install required Dart and Flutter packages:
   ```bash
   flutter pub get
   ```

3. **Set Up Firebase**:
   - Place your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files in the respective directories.
   - Configure Firebase Authentication and Firestore rules as outlined in the [Firebase Documentation](https://firebase.google.com/docs).

4. **Run the App**:
   ```bash
   flutter run
   ```

---

## 🛠️ **Usage**

1. **Sign In**:
   - Use your Google account to log in securely.
   - Join or create a family group.

2. **Create Affirmations**:
   - Write text or upload audio/image affirmations.
   - Assign affirmations to specific family members.

3. **Set Reminders**:
   - Schedule daily notifications to ensure engagement.

4. **Track Progress**:
   - View badges and streaks in your user profile.

---

## 🏗️ **Project Architecture**

Riser is built using the following stack:

- **Frontend**: 
  - **FlutterFlow**: Streamlined UI development with custom Dart widgets.
  - **Dart**: Efficient, cross-platform app functionality.

- **Backend**:
  - **Firebase**: A robust backend solution providing:
    - **Firestore Database**: Stores affirmations, user profiles, and activity logs.
    - **Firebase Authentication**: Manages secure user login.
    - **Firebase Storage**: Stores media files.
    - **Firebase Cloud Messaging**: Handles notifications.

- **State Management**:
  - Flutter’s native state management ensures dynamic updates across sessions.

---

## 📦 **Core Packages**
1. **Flutter**: Provides the foundation for UI development and app deployment.
2. **Firebase**:
   - **Authentication**: Secure user sign-in using Google credentials.
   - **Firestore**: Stores and retrieves real-time data efficiently.
   - **Storage**: Safely stores user-generated audio and image files.
3. **Google Sign-In**: Integrates Google OAuth for simplified authentication.
4. **Flutter Secure Storage**: Encrypts and securely stores sensitive user data locally.
5. **Image Picker**: Enables users to upload or capture images for affirmations or profiles.
6. **Sqflite**: Facilitates offline access by storing key data locally on the device.
7. **URL Launcher**: Opens external links directly from the application interface.

---

## ⚡ **Performance Optimization**
1. **Firestore Indexes**: Optimized querying to reduce data retrieval times.
2. **Lazy Loading**: Implements efficient loading of media to minimize memory usage.
3. **Caching**: Local storage ensures rapid access to frequently used affirmations.
4. **Widget Optimization**: Simplified widget tree reduces rendering overhead for smoother interactions.

---

## 🔒 **Security Measures**
1. **Data Encryption**: Implements Flutter Secure Storage for encrypting locally stored data.
2. **Firebase Security Rules**: Controls access to Firestore and Storage based on user roles.
3. **OAuth Integration**: Google Sign-In ensures secure authentication protocols.
4. **HTTPS**: All data transmission occurs over secure HTTPS connections.

---

## 🤝 **Contributing**

We welcome contributions to improve Riser! Here's how you can get involved:

1. **Fork the Repository**:
   - Click the "Fork" button at the top-right corner of the repository page.

2. **Create a Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**:
   - Ensure your code adheres to Dart/Flutter best practices.
   - Add comments and documentation as needed.

4. **Submit a Pull Request**:
   - Push your changes and create a pull request on GitHub.

---

## ⚠️ **Known Limitations and Future Enhancements**
1. **Current Limitations**:
   - Offline functionality is restricted to affirmation text and does not support media files.
   - Advanced analytics and insights features are not yet integrated.

2. **Planned Improvements**:
   - Multi-language support to cater to a broader user base.
   - Expanded gamification elements, including leaderboards and customizable rewards.
   - Integration with wearable devices for enhanced reminder functionality.

---

## 📜 **License**

This project is licensed under the [MIT License](LICENSE.md). Feel free to use and modify the code with proper attribution.

---

## 📬 **Contact**

- **Website**: [Riser Official](https://xpressdigital.org)
- **Support Email**: alisttechllc@gmail.com
- **GitHub Issues**: [Report a Bug](https://github.com/Xpress-Digital/Riser/issues)

---

## 📚 **Additional Resources**
1. [Xpress Digital Technical](https://xpressdigital.org/services.html)
2. [Flutter Documentation](https://flutter.dev/docs)
3. [Firebase Documentation](https://firebase.google.com/docs)
4. [Dart Language Guide](https://dart.dev/guides)
5. [FlutterFlow Support](https://docs.flutterflow.io/)

---

Riser transforms how families connect, fostering a culture of positivity, growth, and affirmation. Whether you're a parent, child, or sibling, Riser makes every interaction meaningful.

> _"Stay positive. Stay connected. Together, we rise!"_

