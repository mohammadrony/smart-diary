import { Document, Schema, Model, model, Error } from 'mongoose'
import { ITask } from './task.model'
import { ICourse } from './course.model'

export interface IPublishedTask extends Document {
  TaskId: ITask['_id']
  CourseId: ICourse['_id']
  todosBool: String
}

export const publishedTaskSchema = new Schema({
  TaskId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Task'
  }],
  CourseId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Course'
  }],
  todosBool: String,
})

export const PublishedTask: Model<IPublishedTask> = model<IPublishedTask>('PublishedTask', publishedTaskSchema)
