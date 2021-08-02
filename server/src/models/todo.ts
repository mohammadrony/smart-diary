import { Document, Schema, Model, model, Error } from 'mongoose'

export interface ITodo extends Document {
  title: String
  isDone: Number
  TaskId: Number
}

export const todoSchema = new Schema({
  title: String,
  isDone: Number,
  TaskId: Number,
})

export const Todo: Model<ITodo> = model<ITodo>('Todo', todoSchema)
