"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Task = exports.taskSchema = void 0;
const mongoose_1 = require("mongoose");
exports.taskSchema = new mongoose_1.Schema({
    id: {
        type: String,
        required: true,
        unique: true,
    },
    title: String,
    description: String,
});
exports.Task = mongoose_1.model('Task', exports.taskSchema);
//# sourceMappingURL=task.js.map