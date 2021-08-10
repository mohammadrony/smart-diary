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
exports.PublishedTaskController = void 0;
const published_task_1 = require("../models/published-task");
class PublishedTaskController {
    getPublishedTasks(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const publishedTasks = yield published_task_1.PublishedTask.find();
            res.json({ publishedTasks });
        });
    }
    getPublishedTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const publishedTask = yield published_task_1.PublishedTask.findById(req.params.id);
            if (publishedTask === null) {
                res.sendStatus(404);
            }
            else {
                res.json(publishedTask);
            }
        });
    }
    createPublishedTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const newPublishedTask = new published_task_1.PublishedTask(req.body);
            const publishedTask = yield published_task_1.PublishedTask.findById(req.body.id);
            if (publishedTask === null) {
                const result = yield newPublishedTask.save();
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
    updatePublishedTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const publishedTask = yield published_task_1.PublishedTask.findOneAndUpdate({ _id: req.params.id }, req.body);
            if (publishedTask === null) {
                res.sendStatus(404);
            }
            else {
                const updatedPublishedTask = Object.assign({ _id: req.params.id }, req.body);
                res.json({ status: res.status, data: updatedPublishedTask });
            }
        });
    }
    deletePublishedTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const publishedTask = yield published_task_1.PublishedTask.findOneAndDelete({ _id: req.params.id });
            if (publishedTask === null) {
                res.sendStatus(404);
            }
            else {
                res.json({ response: 'PublishedTask deleted Successfully' });
            }
        });
    }
}
exports.PublishedTaskController = PublishedTaskController;
//# sourceMappingURL=PublishedTaskController.js.map