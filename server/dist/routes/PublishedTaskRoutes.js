"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PublishedTaskRoutes = void 0;
const express_1 = require("express");
const PublishedTaskController_1 = require("../controllers/PublishedTaskController");
const AuthController_1 = require("../controllers/AuthController");
class PublishedTaskRoutes {
    constructor() {
        this.publishedTaskController = new PublishedTaskController_1.PublishedTaskController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/published-task
        this.router.get('/', this.publishedTaskController.getPublishedTasks);
        this.router.get('/:id', this.publishedTaskController.getPublishedTask);
        this.router.post('/', 
        // this.authController.authenticateJWT, 
        this.publishedTaskController.createPublishedTask);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.publishedTaskController.updatePublishedTask);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.publishedTaskController.deletePublishedTask);
    }
}
exports.PublishedTaskRoutes = PublishedTaskRoutes;
//# sourceMappingURL=PublishedTaskRoutes.js.map