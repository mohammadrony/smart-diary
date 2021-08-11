"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CourseTakeRoutes = void 0;
const express_1 = require("express");
const courseTakeController_1 = require("../controllers/courseTakeController");
const AuthController_1 = require("../controllers/AuthController");
class CourseTakeRoutes {
    constructor() {
        this.courseTakeController = new courseTakeController_1.courseTakeController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/course-take
        this.router.get('/', this.courseTakeController.getCourseTakes);
        this.router.get('/:id', this.courseTakeController.getCourseTake);
        this.router.post('/', 
        // this.authController.authenticateJWT, 
        this.courseTakeController.createCourseTake);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.courseTakeController.updateCourseTake);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.courseTakeController.deleteCourseTake);
    }
}
exports.CourseTakeRoutes = CourseTakeRoutes;
//# sourceMappingURL=CourseTakeRoutes.js.map