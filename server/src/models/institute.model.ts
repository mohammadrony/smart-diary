import { Document, Schema, Model, model, Error} from 'mongoose'

export interface IInstitute extends Document {
  name: String
  logoUrl: String
  city: String
  country: String
}

export const instituteSchema = new Schema ({
  name: {
    type: String,
    required: true
  },
  logoUrl: String,
  city: {
    type: String,
    required: true
  },
  country: {
    type: String,
    required: true
  }
})

export const Institute: Model<IInstitute> = model<IInstitute>('Institute', instituteSchema)