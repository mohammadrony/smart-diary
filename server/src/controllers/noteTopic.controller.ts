import { Request, Response } from 'express'
import { INoteTopic, NoteTopic } from '../models/noteTopic.model'

export class noteTopicController {
  public async getNoteTopics(req: Request, res: Response): Promise<void> {
    const noteTopics = await NoteTopic.find()
    res.json({ noteTopics })
  }

  public async getNoteTopic(req: Request, res: Response): Promise<void> {
    const noteTopic = await NoteTopic.findById(req.params.id)
    if (noteTopic === null) {
      res.sendStatus(404)
    } else {
      res.json(noteTopic)
    }
  }

  public async createNoteTopic(req: Request, res: Response): Promise<void> {
    const newNoteTopic: INoteTopic = new NoteTopic(req.body)
    
    const noteTopic = await NoteTopic.findById(req.body.id)
    if (noteTopic === null) {
      const result = await newNoteTopic.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateNoteTopic(req: Request, res: Response): Promise<void> {
    const noteTopic = await NoteTopic.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (noteTopic === null) {
      res.sendStatus(404)
    } else {
      const updatedNoteTopic = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedNoteTopic })
    }
  }

  public async deleteNoteTopic(req: Request, res: Response): Promise<void> {
    const noteTopic = await NoteTopic.findOneAndDelete({ _id: req.params.id })
    if (noteTopic === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'NoteTopic deleted Successfully' })
    }
  }
}
