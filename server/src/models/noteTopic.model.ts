import { Document, Schema, Model, model, Error } from 'mongoose'
import { INoteSubject } from './noteSubject.model'

export interface INoteTopic extends Document {
  title: String
  createdBy: String
  createdAt: String
  NoteSubjectId: INoteSubject['_id']
}

export const noteTopicSchema = new Schema({
  title: String,
  createdBy: String,
  createdAt: String,
  NoteSubjectId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'NoteSubject'
  }
})

export const NoteTopic: Model<INoteTopic> = model<INoteTopic>('NoteTopic', noteTopicSchema)
