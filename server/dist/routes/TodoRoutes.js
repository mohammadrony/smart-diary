"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TodoRoutes = void 0;
const express_1 = require("express");
const TodoController_1 = require("../controllers/TodoController");
const AuthController_1 = require("../controllers/AuthController");
class TodoRoutes {
    constructor() {
        this.todoController = new TodoController_1.TodoController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        this.router.get('/', this.todoController.getTodos);
        this.router.get('/:id', this.todoController.getTodo);
        this.router.post('/', this.authController.authenticateJWT, this.todoController.createTodo);
        this.router.put('/:id', this.authController.authenticateJWT, this.todoController.updateTodo);
        this.router.delete('/:id', this.authController.authenticateJWT, this.todoController.deleteTodo);
    }
}
exports.TodoRoutes = TodoRoutes;
//# sourceMappingURL=TodoRoutes.js.map