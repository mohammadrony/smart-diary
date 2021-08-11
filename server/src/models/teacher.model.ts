import { Document, Schema, Model, model, Error } from 'mongoose'
import bcrypt from 'bcrypt-nodejs'
import { IDepartment } from './department.model'

export interface ITeacher extends Document {
  email: string
  name: string
  phoneNo: string
  password: string
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
    required: true,
  },
  phoneNo: String,
  password: {
    type: String,
    required: true,
  },
  DepartmentId: [{
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'Department'
  }],
  
})

teacherSchema.pre<ITeacher>('save', function save(next) {
  const teacher = this

  bcrypt.genSalt(10, (err, salt) => {
    if (err) {
      return next(err)
    }
    bcrypt.hash(this.password, salt, undefined, (err: Error, hash) => {
      if (err) {
        return next(err)
      }
      teacher.password = hash
      next()
    })
  })
})

teacherSchema.methods.comparePassword = function (candidatePassword: string, callback: any) {
  bcrypt.compare(candidatePassword, 'this.password', (err: Error, isMatch: boolean) => {
    callback(err, isMatch)
  })
}

export const Teacher: Model<ITeacher> = model<ITeacher>('Teacher', teacherSchema)
