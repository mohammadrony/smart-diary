"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CourseRoutes = void 0;
const express_1 = require("express");
const CourseController_1 = require("../controllers/CourseController");
const AuthController_1 = require("../controllers/AuthController");
class CourseRoutes {
    constructor() {
        this.courseController = new CourseController_1.CourseController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/course
        this.router.get('/', this.courseController.getCourses);
        this.router.get('/:id', this.courseController.getCourse);
        this.router.post('/', 
        // this.authController.authenticateJWT, 
        this.courseController.createCourse);
        this.router.put('/:id', 
        // this.authController.authenticateJWT,
        this.courseController.updateCourse);
        this.router.delete('/:id', 
        // this.authController.authenticateJWT,
        this.courseController.deleteCourse);
    }
}
exports.CourseRoutes = CourseRoutes;
//# sourceMappingURL=CourseRoutes.js.map