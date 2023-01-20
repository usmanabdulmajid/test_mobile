# test_mobile


## About project
This is a test project that makes use of Dummy REST API for authentication and getting list of products.

## Architecture
This project's architecture consists of three(3) basic layers:
- Data: This is the network layer that communicates directly with the API and returns raw and unmodified data to the Domain layer.
- Domain: This is the repository that acts as an intermediary between the Data layer and Viewmodel (provider). This layer handles convertion and modification of data coming from the data layer to our predefined D.T.Os (Data Transfer Objects) and possibly handle caching if the need arises.
- Features: This part of the architecture contains the UI and viewmodels which communicates directly to the Domain layer for data.

## Challenges encountered
- The auth/login endpoint for the Dummy API fails to validate any of the predefined [users](https://dummyjson.com/users). As a result of this, a FakeAuth api class was created to simulate the login endpoint and create a user object

## Folder Structure
```
lib/
|- core/
|- data/
|- domain/
|- features/
|- di.dart
|- main.dart
```


## How to install
To clone this project, open your terminal or cmd
```
cd folder/to/clone-into/
```

```
https://github.com/usmanabdulmajid/test_mobile.git
```

## How to run
- Locate and open project with android studio or Vscode or intellij IDE.

Get dependencies:
```
C:\path\to\project> flutter pub get

```
Run
```
C:\path\to\project> flutter run
```

## Prerequisites

Things you need to run the app

```
* Android Studio/Vscode/Intellij IDE
* Flutter SDK
* Android SDK
* MacBook / Windows / Linux
```

## Libraries & Tools Used
- [dio](https://pub.dev/packages/dio)
- [another_flushbar](https://pub.dev/packages/another_flushbar)
- [dotted_border](https://pub.dev/packages/dotted_border)
- [get_it](https://pub.dev/packages/get_it)
- [intl](https://pub.dev/packages/intl)
- [logger](https://pub.dev/packages/logger)
- [provider](https://pub.dev/packages/provider)

