import { Document, Schema, Model, model, Error } from 'mongoose'
import { IInstitute } from './institute.model'

export interface IDepartment extends Document {
  name: String
  InstituteId: IInstitute['_id']
}

export const departmentSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  InstituteId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Institute'
  }
})

export const Department: Model<IDepartment> = model<IDepartment>('Department', departmentSchema)