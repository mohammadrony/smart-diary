import { Document, Schema, Model, model, Error } from 'mongoose'
import { ITask } from './task'
import { ICourse } from './course'

export interface IPublishedTask extends Document {
  TaskId: ITask['_id']
  CourseId: ICourse['_id']
  todosBool: String
}

export const publishedTaskSchema = new Schema({
  TaskId: [{ type: Schema.Types.ObjectId, ref: 'Task' }],
  CourseId: [{ type: Schema.Types.ObjectId, ref: 'Course' }],
  todosBool: String,
})

export const PublishedTask: Model<IPublishedTask> = model<IPublishedTask>('PublishedTask', publishedTaskSchema)
