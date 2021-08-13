import { Document, Schema, Model, model, Error } from 'mongoose'
import { INoteTopic } from './noteTopic.model'

export interface INoteMaterial extends Document {
  caption: String
  text: String
  resourceType: String
  imageUrl: String
  videoUrl: String
  fileUrl: String
  createdAt: String
  NoteTopicId: INoteTopic['_id']
}

export const noteMaterialSchema = new Schema({
  caption: String,
  text: String,
  resourceType: String,
  imageUrl: String,
  videoUrl: String,
  fileUrl: String,
  createdAt: String,
  NoteTopicId: {
    type: Schema.Types.ObjectId,
    required: true,
    ref: 'NoteTopic'
  }
})

export const NoteMaterial: Model<INoteMaterial> = model<INoteMaterial>('NoteMaterial', noteMaterialSchema)
