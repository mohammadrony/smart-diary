import { Document, Schema, Model, model, Error } from 'mongoose'
import { ICourse } from './course.model'

export interface ITask extends Document {
  title: String
  description: String
  CourseId: ICourse['_id']
}

export const taskSchema = new Schema({
  title: String,
  description: String,
  CourseId: [{
    type: Schema.Types.ObjectId,
    ref: 'Course'
  }]
})

export const Task: Model<ITask> = model<ITask>('Task', taskSchema)
