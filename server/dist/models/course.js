"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Course = exports.courseSchema = void 0;
const mongoose_1 = require("mongoose");
exports.courseSchema = new mongoose_1.Schema({
    courseId: {
        type: String,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    session: {
        type: String,
        required: true,
    },
    credit: {
        type: Number,
        required: true,
    },
    discipline: {
        type: String,
        required: true,
    },
});
exports.Course = mongoose_1.model('Course', exports.courseSchema);
//# sourceMappingURL=course.js.map