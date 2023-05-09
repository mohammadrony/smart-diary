# smart-diary
A developing project for students daily task and note management. In this project I'm using [flutter](https://flutter.dev/) for the frontend with [getx](https://pub.dev/packages/get) framework and [getx pattern](https://github.com/kauemurakami/getx_pattern) folder structure.
And node.js framework in backend with [typescript](https://www.typescriptlang.org/) language and [mongodb](https://www.mongodb.com/) database.

## Followed Tutorials
[YouTube - TVAC Studio - Flutter - Todo App from Scratch](https://www.youtube.com/playlist?list=PLGCjwl1RrtcSlUrd_-Z-924b3ahWISiDh)\
[YouTube - Programming Addict - Consuming a REST API with Flutter](https://www.youtube.com/playlist?list=PL_Wj0DgxTlJeLFYfRBfpFveEd9cQfIpDx)

## Followed Repositories
[GitHub - Jerry Chong - node-express-mongo-passport-jwt-typescript](https://github.com/jerrychong25/node-express-mongo-passport-jwt-typescript)\
[GitHub - Delay - flutter-starter](https://github.com/delay/flutter_starter)

## Run Backend
```
cd server
npm install
npx tsc
npm start
```
## Run Frontend
```
cd diary_ui
flutter pub get
flutter run
```
## Error to resolve
When back from Create course page in `diary_ui/lib/app/modules/teacher_home/views/teacher_home_view.dart` file **Backend crash** maybe after receiving **wrong parameter** related to mongodb **_id**.
