import { Document, Schema, Model, model, Error } from 'mongoose'
import { ITask } from './task.model'
import { IStudent } from './student.model'

export interface IPublishedTask extends Document {
  TaskId: ITask['_id']
  StudentId: IStudent['_id']
  todosBool: String
}

export const publishedTaskSchema = new Schema({
  TaskId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Task'
  },
  StudentId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Student'
  },
  todosBool: String,
})

export const PublishedTask: Model<IPublishedTask> = model<IPublishedTask>('PublishedTask', publishedTaskSchema)
