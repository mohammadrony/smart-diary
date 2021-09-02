import { Document, Schema, Model, model, Error } from 'mongoose'
import bcrypt from 'bcryptjs'
import { IDepartment } from './department.model'

export interface ITeacher extends Document {
  email: string
  name: string
  phoneNo: string
  password: string
  imageUrl: string
  DepartmentId: IDepartment['_id']
}

export const teacherSchema: Schema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true,
  },
  name: {
    type: String,
    required: true
  },
  phoneNo: String,
  password: {
    type: String,
    required: true,
  },
  imageUrl: String,
  DepartmentId: {
    type: Schema.Types.ObjectId,
    ref: 'Department'
  }
})

teacherSchema.pre<ITeacher>('save', function save(next) {
  const teacher = this

  if (teacher.isModified("password") || teacher.isNew) {
    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        return next(err)
      }
      bcrypt.hash(this.password, salt, (err: Error, hash) => {
        if (err) {
          return next(err)
        }
        teacher.password = hash
        next()
      })
    })
  } else {
    return next()
  }
})

teacherSchema.methods.comparePassword = function (candidatePassword: string, correctPassword: string, callback: any) {
  bcrypt.compare(candidatePassword, correctPassword, (err: Error, isMatch: boolean) => {
    callback(err, isMatch)
  })
}

export const Teacher: Model<ITeacher> = model<ITeacher>('Teacher', teacherSchema)
