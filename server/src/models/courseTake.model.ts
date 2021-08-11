import { Document, Schema, Model, model, Error } from 'mongoose'
import { IStudent } from './student.model'
import { ICourse } from './course.model'

export interface ICourseTake extends Document {
  StudentId: IStudent['_id']
  CourseId: ICourse['_id']
}

export const courseTakeSchema = new Schema({
  StudentId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Student'
  }],
  CourseId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Course'
  }],
})

export const CourseTake: Model<ICourseTake> = model<ICourseTake>('CourseTake', courseTakeSchema)
