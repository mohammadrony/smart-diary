import { Document, Schema, Model, model, Error } from 'mongoose'
import { IDepartment } from './department.model'

export interface ICourse extends Document {
  courseId: String
  title: String
  session: String
  credit: Number
  DepartmentId: IDepartment['_id']
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
  DepartmentId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Department'
  }
})

export const Course: Model<ICourse> = model<ICourse>('Course', courseSchema)
