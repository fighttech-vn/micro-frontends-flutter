# micro_frontends_flutter: 
Live: https://flutter-fightkit.web.app/

# Features
 - [x] Get assets multi packages
 - [x] Localize to package
 - [x] Flutter lint
 - [x] Pipeline
 - [x] Storybook isolate dependencies for screen and ui
 - [x] Theme dark mode and light mode
 - [x] Communicate Cross domain (MultiBlocProvicer)
 - [ ] Router for Navigator
  
## Add new package
```
  flutter create --template=package hello
  
  flutter create --template=package core
  flutter create --template=package app_engine
```

## Add project 
```
flutter create --org com.yourdomain your_app_name

```

# Architecture

![Alt text](docs/Architecture.svg)


# API

```
curl --location --request GET 'https://randomuser.me/api/' \
--header 'authority: randomuser.me' \
--header 'accept: application/json' \
--header 'x-requested-with: XMLHttpRequest'
```
