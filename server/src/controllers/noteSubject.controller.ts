import { Request, Response } from 'express'
import { INoteSubject, NoteSubject } from '../models/noteSubject.model'

export class noteSubjectController {
  public async getNoteSubjects(req: Request, res: Response): Promise<void> {
    const noteSubjects = await NoteSubject.find()
    res.json({ noteSubjects })
  }

  public async getNoteSubject(req: Request, res: Response): Promise<void> {
    const noteSubject = await NoteSubject.findById(req.params.id)
    if (noteSubject === null) {
      res.sendStatus(404)
    } else {
      res.json(noteSubject)
    }
  }

  public async createNoteSubject(req: Request, res: Response): Promise<void> {
    const newNoteSubject: INoteSubject = new NoteSubject(req.body)
    
    const noteSubject = await NoteSubject.findById(req.body.id)
    if (noteSubject === null) {
      const result = await newNoteSubject.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateNoteSubject(req: Request, res: Response): Promise<void> {
    const noteSubject = await NoteSubject.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (noteSubject === null) {
      res.sendStatus(404)
    } else {
      const updatedNoteSubject = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedNoteSubject })
    }
  }

  public async deleteNoteSubject(req: Request, res: Response): Promise<void> {
    const noteSubject = await NoteSubject.findOneAndDelete({ _id: req.params.id })
    if (noteSubject === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'NoteSubject deleted Successfully' })
    }
  }
}
