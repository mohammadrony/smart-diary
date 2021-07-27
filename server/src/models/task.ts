import { Document, Schema, Model, model, Error } from 'mongoose'

export interface ITask extends Document {
  id: String
  idt: Number
  title: String
  description: String
}

export const taskSchema = new Schema({
  id: {
    type: String,
    required: true,
    unique: true,
  },
  title: String,
  description: String,
})

export const Task: Model<ITask> = model<ITask>('Task', taskSchema)
