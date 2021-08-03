import { Document, Schema, Model, model, Error, Date } from 'mongoose'

export interface ITodo extends Document {
  title: String
  isDone: Number
  description: String
  dueDate: String
  TaskId: String
}

export const todoSchema = new Schema({
  title: String,
  isDone: Number,
  description: String,
  dueDate: String,
  TaskId: String,
})

export const Todo: Model<ITodo> = model<ITodo>('Todo', todoSchema)
