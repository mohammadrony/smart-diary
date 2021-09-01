import { Document, Schema, Model, model, Error } from 'mongoose'
import { ITask } from './task.model'

export interface ITodo extends Document {
  title: String
  isDone: Number
  description: String
  dueDate: String
  TaskId: ITask['_id']
}

export const todoSchema = new Schema({
  title: String,
  isDone: Number,
  description: String,
  dueDate: String,
  TaskId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Task'
  },
})

export const Todo: Model<ITodo> = model<ITodo>('Todo', todoSchema)
