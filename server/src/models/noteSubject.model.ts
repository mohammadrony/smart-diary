import { Document, Schema, Model, model, Error } from 'mongoose'
import { ICourse } from './course.model'
import { ITeacher } from './teacher.model'
import { IStudent } from './student.model'

export interface INoteSubject extends Document {
  name: String
  description: String
  CourseId: ICourse['_id']
  TeacherId: ITeacher['_id']
  StudentId: IStudent['_id']
}

export const noteSubjectSchema = new Schema({
  name: String,
  description: String,
  CourseId: {
    type: Schema.Types.ObjectId,
    ref: 'Course'
  },
  TeacherId: {
    type: Schema.Types.ObjectId,
    ref: 'Teacher'
  },
  StudentId: {
    type: Schema.Types.ObjectId,
    ref: 'Student'
  }
})

export const NoteSubject: Model<INoteSubject> = model<INoteSubject>('NoteSubject', noteSubjectSchema)
