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
Object.defineProperty(exports, "__esModule", { value: true });
exports.CourseController = void 0;
const course_1 = require("../models/course");
class CourseController {
    getCourses(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const courses = yield course_1.Course.find();
            res.json({ courses });
        });
    }
    getCourse(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const course = yield course_1.Course.findById(req.params.id);
            if (course === null) {
                res.sendStatus(404);
            }
            else {
                res.json(course);
            }
        });
    }
    createCourse(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const newCourse = new course_1.Course(req.body);
            const course = yield course_1.Course.findById(req.body.id);
            if (course === null) {
                const result = yield newCourse.save();
                if (result === null) {
                    res.sendStatus(500);
                }
                else {
                    res.status(201).json({ status: 201, data: result });
                }
            }
            else {
                res.sendStatus(422);
            }
        });
    }
    updateCourse(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const course = yield course_1.Course.findOneAndUpdate({ _id: req.params.id }, req.body);
            if (course === null) {
                res.sendStatus(404);
            }
            else {
                const updatedCourse = Object.assign({ _id: req.params.id }, req.body);
                res.json({ status: res.status, data: updatedCourse });
            }
        });
    }
    deleteCourse(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const course = yield course_1.Course.findOneAndDelete({ _id: req.params.id });
            if (course === null) {
                res.sendStatus(404);
            }
            else {
                res.json({ response: 'Course deleted Successfully' });
            }
        });
    }
}
exports.CourseController = CourseController;
//# sourceMappingURL=CourseController.js.map