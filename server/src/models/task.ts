import { Document, Schema, Model, model, Error } from 'mongoose'

export interface ITask extends Document {
  title: String
  description: String
}

export const taskSchema = new Schema({
  title: String,
  description: String,
})

export const Task: Model<ITask> = model<ITask>('Task', taskSchema)
