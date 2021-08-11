"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TodoRoutes = void 0;
const express_1 = require("express");
const todoController_1 = require("../controllers/todoController");
const AuthController_1 = require("../controllers/AuthController");
class TodoRoutes {
    constructor() {
        this.todoController = new todoController_1.todoController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/todo
        this.router.get('/:taskId', this.todoController.getTodos);
        this.router.post('/', 
        // this.authController.authenticateJWT,
        this.todoController.createTodo);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.todoController.updateTodo);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.todoController.deleteTodo);
        this.router.delete('/task/:taskId', 
        // this.authController.authenticateJWT,
        this.todoController.deleteTodoByTask);
    }
}
exports.TodoRoutes = TodoRoutes;
//# sourceMappingURL=TodoRoutes.js.map