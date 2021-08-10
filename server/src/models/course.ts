import { Document, Schema, Model, model, Error } from 'mongoose'

export interface ICourse extends Document {
  courseId: String
  title: String
  session: String
  credit: Number
  discipline: String
}

export const courseSchema = new Schema({
  courseId: {
    type: String,
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  session: {
    type: String,
    required: true,
  },
  credit: {
    type: Number,
    required: true,
  },
  discipline: {
    type: String,
    required: true,
  },
})

export const Course: Model<ICourse> = model<ICourse>('Course', courseSchema)
