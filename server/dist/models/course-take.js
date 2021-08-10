"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CourseTake = exports.courseTakeSchema = void 0;
const mongoose_1 = require("mongoose");
exports.courseTakeSchema = new mongoose_1.Schema({
    UserId: [{ type: mongoose_1.Schema.Types.ObjectId, ref: 'User' }],
    CourseId: [{ type: mongoose_1.Schema.Types.ObjectId, ref: 'Course' }],
});
exports.CourseTake = mongoose_1.model('CourseTake', exports.courseTakeSchema);
//# sourceMappingURL=course-take.js.map