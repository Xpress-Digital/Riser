**Technical Documentation for Riser**

---

### **Overview**
Riser is a mobile application designed to enhance family relationships by facilitating shared affirmations. Built with FlutterFlow, a low-code development platform, it employs the Dart programming language and various Flutter packages to deliver an intuitive user experience. The app incorporates Firebase for its backend operations, providing robust data management and security.

---

### **Technical Architecture**
1. **Frontend**:
   - **Framework**: Flutter ensures cross-platform compatibility and a cohesive UI experience.
   - **Language**: Dart, for creating efficient and responsive app functionality.
   - **UI Development**: Leveraging FlutterFlow for rapid prototyping and integrating custom widget designs.

2. **Backend**:
   - **Platform**: Firebase powers Riser's backend to ensure scalability and reliability.
   - **Services Used**:
     - **Firestore Database**: Stores affirmation data, user profiles, and group configurations.
     - **Firebase Authentication**: Manages secure user login and registration.
     - **Firebase Storage**: Handles user-uploaded audio files and images.
     - **Firebase Cloud Messaging**: Sends reminders and notifications.

3. **State Management**:
   - Uses Flutter’s native state management and Firebase real-time sync to keep data dynamic and updated across sessions.

---

### **Core Packages and Their Functions**
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

### **Features and Implementation**
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

### **Deployment and Hosting**
1. **Supported Platforms**: Android and iOS
2. **Hosting**: Firebase Hosting supports dynamic content delivery and serverless backend functionality.
3. **Build Pipeline**:
   - UI and basic app functionality are built using FlutterFlow.
   - Advanced features are implemented using custom Dart scripts.
   - Deployed through Firebase Hosting, Google Play Console, and App Store Connect.

---

### **Performance Optimization**
1. **Firestore Indexes**: Optimized querying to reduce data retrieval times.
2. **Lazy Loading**: Implements efficient loading of media to minimize memory usage.
3. **Caching**: Local storage ensures rapid access to frequently used affirmations.
4. **Widget Optimization**: Simplified widget tree reduces rendering overhead for smoother interactions.

---

### **Security Measures**
1. **Data Encryption**: Implements Flutter Secure Storage for encrypting locally stored data.
2. **Firebase Security Rules**: Controls access to Firestore and Storage based on user roles.
3. **OAuth Integration**: Google Sign-In ensures secure authentication protocols.
4. **HTTPS**: All data transmission occurs over secure HTTPS connections.

---

### **Known Limitations and Future Enhancements**
1. **Current Limitations**:
   - Offline functionality is restricted to affirmation text and does not support media files.
   - Advanced analytics and insights features are not yet integrated.

2. **Planned Improvements**:
   - Multi-language support to cater to a broader user base.
   - Expanded gamification elements, including leaderboards and customizable rewards.
   - Integration with wearable devices for enhanced reminder functionality.

---

### **Additional Resources**
1. [Flutter Documentation](https://flutter.dev/docs)
2. [Firebase Documentation](https://firebase.google.com/docs)
3. [Dart Language Guide](https://dart.dev/guides)
4. [FlutterFlow Support](https://docs.flutterflow.io/)

---

