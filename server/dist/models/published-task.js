"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PublishedTask = exports.publishedTaskSchema = void 0;
const mongoose_1 = require("mongoose");
exports.publishedTaskSchema = new mongoose_1.Schema({
    TaskId: [{ type: mongoose_1.Schema.Types.ObjectId, ref: 'Task' }],
    CourseId: [{ type: mongoose_1.Schema.Types.ObjectId, ref: 'Course' }],
    todosBool: String,
});
exports.PublishedTask = mongoose_1.model('PublishedTask', exports.publishedTaskSchema);
//# sourceMappingURL=published-task.js.map