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
exports.courseTakeController = void 0;
const course_take_1 = require("../models/course-take");
class courseTakeController {
    getCourseTakes(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const courseTakes = yield course_take_1.CourseTake.find();
            res.json({ courseTakes });
        });
    }
    getCourseTake(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const courseTake = yield course_take_1.CourseTake.findById(req.params.id);
            if (courseTake === null) {
                res.sendStatus(404);
            }
            else {
                res.json(courseTake);
            }
        });
    }
    createCourseTake(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const newCourseTake = new course_take_1.CourseTake(req.body);
            const courseTake = yield course_take_1.CourseTake.findById(req.body.id);
            if (courseTake === null) {
                const result = yield newCourseTake.save();
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
    updateCourseTake(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const courseTake = yield course_take_1.CourseTake.findOneAndUpdate({ _id: req.params.id }, req.body);
            if (courseTake === null) {
                res.sendStatus(404);
            }
            else {
                const updatedCourseTake = Object.assign({ _id: req.params.id }, req.body);
                res.json({ status: res.status, data: updatedCourseTake });
            }
        });
    }
    deleteCourseTake(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const courseTake = yield course_take_1.CourseTake.findOneAndDelete({ _id: req.params.id });
            if (courseTake === null) {
                res.sendStatus(404);
            }
            else {
                res.json({ response: 'CourseTake deleted Successfully' });
            }
        });
    }
}
exports.courseTakeController = courseTakeController;
//# sourceMappingURL=courseTakeController.js.map