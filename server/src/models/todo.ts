import { Document, Schema, Model, model, Error } from 'mongoose'

export interface ITodo extends Document {
  id: String
  title: String
  isDone: Number
  TaskId: Number
}

export const todoSchema = new Schema({
  id: {
    type: String,
    required: true,
    unique: true,
  },
  title: String,
  isDone: Number,
  TaskId: Number,
})

export const Todo: Model<ITodo> = model<ITodo>('Todo', todoSchema)
