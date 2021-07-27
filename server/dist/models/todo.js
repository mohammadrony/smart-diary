"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Todo = exports.todoSchema = void 0;
const mongoose_1 = require("mongoose");
exports.todoSchema = new mongoose_1.Schema({
    id: {
        type: String,
        required: true,
        unique: true,
    },
    title: String,
    isDone: Number,
    TaskId: Number,
});
exports.Todo = mongoose_1.model('Todo', exports.todoSchema);
//# sourceMappingURL=todo.js.map