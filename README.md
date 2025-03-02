# QR Code Scanner & Generator

A simple yet powerful Flutter app that allows users to **scan** and **generate** QR codes effortlessly.

## 🚀 Features

- **QR Code Scanning:** Uses the device's camera to scan QR codes and instantly display the data.
- **Auto Link Opening:** If the scanned QR contains a URL, it automatically opens in the browser.
- **QR Code Generation:** Users can input text or a URL to generate a QR code instantly.
- **Intuitive Navigation:** Easily switch between scanner and generator screens.
- **Smooth User Experience:** Fast performance with minimal UI distractions.

## 📱 Screens

1. **Splash Screen:** Displays for 3 seconds before navigating to the home screen.
2. **Home Screen:** Two interactive cards for navigating to the scanner and generator.
3. **Scan QR Code:** Uses the camera to scan QR codes, displays scanned data, and opens links if applicable.
4. **Generate QR Code:** Users enter text or a link to generate a QR code.

## 🛠️ Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/AbdullahAli2005/scanfinity.git
   ```
2. Navigate to the project folder:
   ```sh
   cd qr_code_app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## 📦 Dependencies

Ensure you have the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  pretty_qr_code: ^2.0.2
  mobile_scanner: ^3.2.0
  url_launcher: ^6.1.14
```

## 🔗 License

This project is open-source and available under the MIT License.

---
Made with ❤️ using Flutter.

