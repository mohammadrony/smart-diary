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
const ProductRoutes_1 = require("./routes/ProductRoutes");
const TodoRoutes_1 = require("./routes/TodoRoutes");
const TaskRoutes_1 = require("./routes/TaskRoutes");
const UserRoutes_1 = require("./routes/UserRoutes");
class Server {
    constructor() {
        this.app = express_1.default();
        this.config();
        this.routes();
        this.mongo();
    }
    routes() {
        this.app.use('/api/user', new UserRoutes_1.UserRoutes().router);
        this.app.use('/api/todo', new TodoRoutes_1.TodoRoutes().router);
        this.app.use('/api/task', new TaskRoutes_1.TaskRoutes().router);
        this.app.use('/api/products', new ProductRoutes_1.ProductRoutes().router);
    }
    config() {
        this.app.set('port', process.env.PORT || 3000);
        this.app.use(express_1.default.json());
        this.app.use(express_1.default.urlencoded({ extended: false }));
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