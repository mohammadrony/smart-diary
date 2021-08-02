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
exports.TaskController = void 0;
const task_1 = require("../models/task");
class TaskController {
    getTasks(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const tasks = yield task_1.Task.find();
            res.json({ tasks });
        });
    }
    getTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = yield task_1.Task.findById(req.params.id);
            if (task === null) {
                res.sendStatus(404);
            }
            else {
                res.json(task);
            }
        });
    }
    createTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const newTask = new task_1.Task(req.body);
            console.log('---------------------');
            console.log(req.body);
            console.log('---------------------');
            const task = yield task_1.Task.findById(req.body.id);
            if (task === null) {
                const result = yield newTask.save();
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
    updateTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = yield task_1.Task.findOneAndUpdate({ _id: req.params.id }, req.body);
            if (task === null) {
                res.sendStatus(404);
            }
            else {
                const updatedTask = Object.assign({ _id: req.params.id }, req.body);
                res.json({ status: res.status, data: updatedTask });
            }
        });
    }
    deleteTask(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = yield task_1.Task.findOneAndDelete({ _id: req.params.id });
            if (task === null) {
                res.sendStatus(404);
            }
            else {
                res.json({ response: 'Task deleted Successfully' });
            }
        });
    }
}
exports.TaskController = TaskController;
//# sourceMappingURL=TaskController.js.map