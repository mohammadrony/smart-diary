"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const mongoose_1 = __importDefault(require("mongoose"));
if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
}
const compression_1 = __importDefault(require("compression"));
const cors_1 = __importDefault(require("cors"));
const secrets_1 = require("./util/secrets");
const course_routes_1 = require("./routes/course.routes");
const courseTake_routes_1 = require("./routes/courseTake.routes");
const courseTeach_routes_1 = require("./routes/courseTeach.routes");
const department_routes_1 = require("./routes/department.routes");
const institute_routes_1 = require("./routes/institute.routes");
const product_routes_1 = require("./routes/product.routes");
const publishedTask_routes_1 = require("./routes/publishedTask.routes");
const student_routes_1 = require("./routes/student.routes");
const task_routes_1 = require("./routes/task.routes");
const teacher_routes_1 = require("./routes/teacher.routes");
const todo_routes_1 = require("./routes/todo.routes");
class Server {
    constructor() {
        this.app = express_1.default();
        this.config();
        this.routes();
        this.mongo();
    }
    routes() {
        this.app.use('/api/course', new course_routes_1.courseRoutes().router);
        this.app.use('/api/courseTake', new courseTake_routes_1.courseTakeRoutes().router);
        this.app.use('/api/courseTeach', new courseTeach_routes_1.courseTeachRoutes().router);
        this.app.use('/api/department', new department_routes_1.departmentRoutes().router);
        this.app.use('/api/institute', new institute_routes_1.instituteRoutes().router);
        this.app.use('/api/products', new product_routes_1.productRoutes().router);
        this.app.use('/api/publishedTask', new publishedTask_routes_1.publishedTaskRoutes().router);
        this.app.use('/api/student', new student_routes_1.studentRoutes().router);
        this.app.use('/api/task', new task_routes_1.taskRoutes().router);
        this.app.use('/api/teacher', new teacher_routes_1.teacherRoutes().router);
        this.app.use('/api/todo', new todo_routes_1.todoRoutes().router);
    }
    config() {
        this.app.set('port', process.env.PORT || 3000);
        this.app.use(express_1.default.json());
        this.app.use(express_1.default.urlencoded({ extended: true }));
        this.app.use(compression_1.default());
        this.app.use(cors_1.default());
    }
    mongo() {
        const connection = mongoose_1.default.connection;
        connection.on('connected', () => {
            console.log('Mongo Connection Established');
        });
        connection.on('reconnected', () => {
            console.log('Mongo Connection Reestablished');
        });
        connection.on('disconnected', () => {
            console.log('Mongo Connection Disconnected');
            console.log('Trying to reconnect to Mongo ...');
            setTimeout(() => {
                mongoose_1.default.connect(secrets_1.MONGODB_URI, {
                    useNewUrlParser: true,
                    useUnifiedTopology: true,
                    useCreateIndex: true,
                    keepAlive: true,
                    socketTimeoutMS: 3000,
                    connectTimeoutMS: 3000,
                });
            }, 3000);
        });
        connection.on('close', () => {
            console.log('Mongo Connection Closed');
        });
        connection.on('error', (error) => {
            console.log('Mongo Connection ERROR: ' + error);
        });
        mongoose_1.default.set('useNewUrlParser', true);
        mongoose_1.default.set('useFindAndModify', false);
        mongoose_1.default.set('useCreateIndex', true);
        mongoose_1.default.set('useUnifiedTopology', true);
        const run = () => __awaiter(this, void 0, void 0, function* () {
            yield mongoose_1.default.connect(secrets_1.MONGODB_URI, {
                useNewUrlParser: true,
                useUnifiedTopology: true,
                useCreateIndex: true,
                keepAlive: true,
            });
        });
        run().catch((error) => console.error(error));
    }
    start() {
        this.app.listen(this.app.get('port'), () => {
            console.log('API is running at http://localhost:%d', this.app.get('port'));
        });
    }
}
const server = new Server();
server.start();
//# sourceMappingURL=server.js.map