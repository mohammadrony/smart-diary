import { Document, Schema, Model, model, Error } from 'mongoose'
import bcrypt from 'bcryptjs'
import { IDepartment } from './department.model'

export interface IStudent extends Document {
  email: string
  name: string
  stdId: string
  password: string
  imageUrl: string
  DepartmentId: IDepartment['_id']
}

export const studentSchema: Schema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  name: String,
  stdId: String,
  password: {
    type: String,
    required: true,
  },
  imageUrl: String,
  DepartmentId: {
    type: Schema.Types.ObjectId,
    ref: 'Department'
  },
  
})

studentSchema.pre<IStudent>('save', function save(next) {
  const student = this

  if (student.isModified("password") || student.isNew) {
    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        return next(err)
      }
      bcrypt.hash(this.password, salt, (err: Error, hash) => {
        if (err) {
          return next(err)
        }
        student.password = hash
        next()
      })
    })
  } else {
    return next()
  }
})

studentSchema.methods.comparePassword = function (candidatePassword: string, correctPassword: string, callback: any) {
  bcrypt.compare(candidatePassword, correctPassword, (err: Error, isMatch: boolean) => {
    callback(err, isMatch)
  })
}

export const Student: Model<IStudent> = model<IStudent>('Student', studentSchema)
