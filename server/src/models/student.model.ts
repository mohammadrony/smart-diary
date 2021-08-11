import { Document, Schema, Model, model, Error } from 'mongoose'
import bcrypt from 'bcrypt-nodejs'
import { IDepartment } from './department.model'

export interface IStudent extends Document {
  email: string
  stdId: string
  name: string
  password: string
  DepartmentId: IDepartment['_id']
}

export const studentSchema: Schema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  stdId: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  DepartmentId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Department'
  },
  
})

studentSchema.pre<IStudent>('save', function save(next) {
  const student = this

  bcrypt.genSalt(10, (err, salt) => {
    if (err) {
      return next(err)
    }
    bcrypt.hash(this.password, salt, undefined, (err: Error, hash) => {
      if (err) {
        return next(err)
      }
      student.password = hash
      next()
    })
  })
})

studentSchema.methods.comparePassword = function (candidatePassword: string, callback: any) {
  bcrypt.compare(candidatePassword, 'this.password', (err: Error, isMatch: boolean) => {
    callback(err, isMatch)
  })
}

export const Student: Model<IStudent> = model<IStudent>('Student', studentSchema)
