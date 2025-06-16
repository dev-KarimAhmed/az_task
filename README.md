

# 🚀 AZ Task – Onboarding + Animated Dashboard App

A Flutter application showcasing **animated onboarding**, a **mock login page**, and an **animated dashboard**, built using **clean architecture** and **Bloc** for state management. All animations are implemented **without third-party animation packages** , **Splash Screen** Was Created Using flutter Without any Packages for more customization.

---

## ✨ Features Implemented

### 1. **Splash + Onboarding Screen**

* Splash screen with animated app logo (Fade/Scale transition).
* Horizontal **PageView** onboarding with:

  * Smooth transitions between pages.
  * Fade-in “Get Started” button on the last page.

### 2. **Login Page (UI only)**

* Email & Password fields with typing animation.
* Animated **Login** button (loading spinner + morph animation).
* Navigation to Dashboard on login (no actual authentication logic).

### 3. **Dashboard Page**

* 3 informative cards (e.g., Orders, Sales, Messages).

  * Appearing sequentially using **SlideTransition** & **FadeTransition**.
* **FloatingActionButton** that opens a bottom sheet with **animated scale/slide effects**.
* Hero animation between cards and detail screen (bonus implemented).

### 4. **Architecture & State Management**

* Structured using a layered approach:

  * `core/` - Core utilities and shared services.

    * `animation/` – Custom animation helpers.
    * `app/` – App-level settings (e.g., Theme Cubit).
    * `common/` – Reusable widgets.
    * `extensions/` – Navigation helpers.
    * `images/` – Centralized asset references.
    * `routes/` – App routing and navigation logic.
    * `services/` – SharedPreferences management.
    * `theme/` – Light & Dark theme definitions.
  * `features/` – Feature-based layers:

    * `data/` – Models for onboarding and dashboard.
    * `logic/` – Empty in this task (placeholder for future logic).
    * `ui/` – All UI components and screens.

* **Bloc (flutter\_bloc)** used for theme management.

### 5. **Theme**

* Full **Dark Mode** support & Switching between dark and light.
* Clean and consistent color scheme.

### 6. **Bonus**

* Hero animation between dashboard cards and detail screen.
* `flutter_test` setup with one basic widget test (optional).

---

## 🧩 Packages Used

| Package              | Purpose                    |
| -------------------- | -------------------------- |
| `flutter_bloc`       | State management for Theme |
| `shared_preferences` | Theme preference caching   |
| `flutter_screenutil` | Responsive layout          |
| `cupertino_icons`    | iOS-style icons            |

> ✅ All animations are done manually using Flutter’s **implicit & explicit** animation APIs — no animation packages were used.

---

## 📁 Folder Structure

```
lib/
├── core/
│   ├── animation/
│   ├── app/
│   ├── common/
│   ├── extensions/
│   ├── images/
│   ├── routes/
│   ├── services/
│   └── theme/
├── features/
|   |───Layer 
│   ├──── data/
│   ├──── logic/ (empty for now)
│   └──── ui/
```

---

## 🛠 How to Run the App

1. **Clone the repo:**

```bash
git clone https://github.com/yourusername/az_task.git
cd az_task
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the app:**

```bash
flutter run
```

---

## 📦 Project Info

```yaml
name: az_task
description: "AZ Task"
version: 1.0.0+1

environment:
  sdk: ^3.7.2

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.1
  shared_preferences: ^2.5.3
  flutter_screenutil: ^5.9.3
  cupertino_icons: ^1.0.8

flutter:
  uses-material-design: true
  assets:
    - assets/images/
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
        - asset: assets/fonts/Poppins-Medium.ttf
          weight: 500
```

---

## ✅ Completed Task Summary (Arabic)

* تم إنشاء تطبيق يحتوي على:

  * شاشة ترحيب متحركة (Splash + Onboarding).
  * شاشة تسجيل دخول وهمية.
  * صفحة رئيسية فيها بطاقات متحركة وزر يفتح Bottom Sheet.
  * إدارة الحالة باستخدام Bloc.
  * دعم الوضع الليلي.
  * تنفيذ جميع التحريكات بدون استخدام أي حزمة خارجية للأنيميشن.

---
