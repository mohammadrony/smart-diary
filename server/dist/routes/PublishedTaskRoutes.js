"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PublishedTaskRoutes = void 0;
const express_1 = require("express");
const publishedtaskController_1 = require("../controllers/publishedtaskController");
const AuthController_1 = require("../controllers/AuthController");
class PublishedTaskRoutes {
    constructor() {
        this.publishedtaskController = new publishedtaskController_1.publishedtaskController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/published-task
        this.router.get('/', this.publishedtaskController.getPublishedTasks);
        this.router.get('/:id', this.publishedtaskController.getPublishedTask);
        this.router.post('/', 
        // this.authController.authenticateJWT, 
        this.publishedtaskController.createPublishedTask);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.publishedtaskController.updatePublishedTask);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.publishedtaskController.deletePublishedTask);
    }
}
exports.PublishedTaskRoutes = PublishedTaskRoutes;
//# sourceMappingURL=PublishedTaskRoutes.js.map