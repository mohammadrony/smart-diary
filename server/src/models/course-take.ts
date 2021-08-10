import { Document, Schema, Model, model, Error } from 'mongoose'
import { IUser } from './user'
import { ICourse } from './course'

export interface ICourseTake extends Document {
  UserId: IUser['_id']
  CourseId: ICourse['_id']
}

export const courseTakeSchema = new Schema({
  UserId: [{ type: Schema.Types.ObjectId, ref: 'User' }],
  CourseId: [{ type: Schema.Types.ObjectId, ref: 'Course' }],
})

export const CourseTake: Model<ICourseTake> = model<ICourseTake>('CourseTake', courseTakeSchema)
