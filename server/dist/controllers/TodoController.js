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
exports.TodoController = void 0;
const todo_1 = require("../models/todo");
class TodoController {
    getTodos(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const todos = yield todo_1.Todo.find();
            res.json({ todos });
        });
    }
    getTodo(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const todo = yield todo_1.Todo.findOne({ id: req.params.id });
            if (todo === null) {
                res.sendStatus(404);
            }
            else {
                res.json(todo);
            }
        });
    }
    createTodo(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const newTodo = new todo_1.Todo(req.body);
            const todo = yield todo_1.Todo.findOne({ id: req.body.id });
            if (todo === null) {
                const result = yield newTodo.save();
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
    updateTodo(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const todo = yield todo_1.Todo.findOneAndUpdate({ id: req.params.id }, req.body);
            if (todo === null) {
                res.sendStatus(404);
            }
            else {
                const updatedTodo = Object.assign({ id: req.params.id }, req.body);
                res.json({ status: res.status, data: updatedTodo });
            }
        });
    }
    deleteTodo(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const todo = yield todo_1.Todo.findOneAndDelete({ id: req.params.id });
            if (todo === null) {
                res.sendStatus(404);
            }
            else {
                res.json({ response: 'Todo deleted Successfully' });
            }
        });
    }
}
exports.TodoController = TodoController;
//# sourceMappingURL=TodoController.js.map