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

## Screenshots

![Screenshot_20230120-071405](https://user-images.githubusercontent.com/63570223/213631358-84e1c31f-40f5-4ff8-a249-ed9bb83154da.png)

![Screenshot_20230120-071411](https://user-images.githubusercontent.com/63570223/213631384-e9a1a417-23c8-4072-8546-d1cf12cb725c.png)
![Screenshot_20230120-071419](https://user-images.githubusercontent.com/63570223/213631441-707396dc-7b41-47eb-9648-c4c57917c4f7.png)
![Screenshot_20230120-071430](https://user-images.githubusercontent.com/63570223/213631572-60a75a40-74e8-4575-bad0-fc18bb2e3753.png)
![Screenshot_20230120-071443](https://user-images.githubusercontent.com/63570223/213631608-5a1a28a4-7227-4785-a967-39399bd8a2dc.png)
![Screenshot_20230120-071457](https://user-images.githubusercontent.com/63570223/213631633-bfac8ba1-2c95-4823-971f-b55ef45592da.png)


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

