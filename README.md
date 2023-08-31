# smart-diary

A 3-tier application for students and teachers for their sharable task and note management. In this project, I'm using [flutter](https://flutter.dev/) for the frontend with the [getx](https://pub.dev/packages/get) framework and the [getx pattern](https://github.com/kauemurakami/getx_pattern) folder structure.
And [node.js](https://nodejs.org/en) framework in the backend with [typescript](https://www.typescriptlang.org/) language and [mongodb](https://www.mongodb.com/) database.

## Followed Tutorials

[YouTube - TVAC Studio - Flutter - Todo App from Scratch](https://www.youtube.com/playlist?list=PLGCjwl1RrtcSlUrd_-Z-924b3ahWISiDh)\
[YouTube - Programming Addict - Consuming a REST API with Flutter](https://www.youtube.com/playlist?list=PL_Wj0DgxTlJeLFYfRBfpFveEd9cQfIpDx)

## Followed Repositories

[GitHub - Jerry Chong - node-express-mongo-passport-jwt-typescript](https://github.com/jerrychong25/node-express-mongo-passport-jwt-typescript)\
[GitHub - Delay - flutter-starter](https://github.com/delay/flutter_starter)

## Run Database

```bash
systemctl start mongod
```

## Run Backend

```bash
cd server
npm install
npx tsc
npm start
```

## Run Frontend

```bash
cd diary_ui
flutter pub get
flutter run
```

Thank you.
