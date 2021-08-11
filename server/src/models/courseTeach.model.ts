import { Document, Schema, Model, model, Error } from 'mongoose'
import { ITeacher } from './teacher.model'
import { ICourse } from './course.model'

export interface ICourseTeach extends Document {
  TeacherId: ITeacher['_id']
  CourseId: ICourse['_id']
}

export const courseTeachSchema = new Schema({
  TeacherId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Teacher'
  }],
  CourseId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Course'
  }],
})

export const CourseTeach: Model<ICourseTeach> = model<ICourseTeach>('CourseTeach', courseTeachSchema)
