import { Document, Schema, Model, model, Error } from 'mongoose'
import { ICourse } from './course.model'
import { ITeacher } from './teacher.model'
import { IStudent } from './student.model'

export interface ITask extends Document {
  title: String
  description: String
  CourseId: ICourse['_id']
  TeacherId: ITeacher['_id']
  StudentId: IStudent['_id']
}

export const taskSchema = new Schema({
  title: {
    type: String,
    required: true
  },
  description: String,
  CourseId: {
    type: Schema.Types.ObjectId,
    ref: 'Course'
  },
  TeacherId: {
    type: Schema.Types.ObjectId,
    ref: 'Teacher'
  },
  StudentId: {
    type: Schema.Types.ObjectId,
    ref: 'Student'
  }
})

export const Task: Model<ITask> = model<ITask>('Task', taskSchema)
