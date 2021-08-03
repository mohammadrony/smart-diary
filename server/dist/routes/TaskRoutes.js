"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TaskRoutes = void 0;
const express_1 = require("express");
const TaskController_1 = require("../controllers/TaskController");
const AuthController_1 = require("../controllers/AuthController");
class TaskRoutes {
    constructor() {
        this.taskController = new TaskController_1.TaskController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/task
        this.router.get('/', this.taskController.getTasks);
        this.router.get('/:id', this.taskController.getTask);
        this.router.post('/', 
        // this.authController.authenticateJWT, 
        this.taskController.createTask);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.taskController.updateTask);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.taskController.deleteTask);
    }
}
exports.TaskRoutes = TaskRoutes;
//# sourceMappingURL=TaskRoutes.js.map