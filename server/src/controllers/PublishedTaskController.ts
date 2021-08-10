import { Request, Response } from 'express'
import { IPublishedTask, PublishedTask } from '../models/published-task'

export class PublishedTaskController {
  public async getPublishedTasks(req: Request, res: Response): Promise<void> {
    const publishedTasks = await PublishedTask.find()
    res.json({ publishedTasks })
  }

  public async getPublishedTask(req: Request, res: Response): Promise<void> {
    const publishedTask = await PublishedTask.findById(req.params.id)
    if (publishedTask === null) {
      res.sendStatus(404)
    } else {
      res.json(publishedTask)
    }
  }

  public async createPublishedTask(req: Request, res: Response): Promise<void> {
    const newPublishedTask: IPublishedTask = new PublishedTask(req.body)
    const publishedTask = await PublishedTask.findById(req.body.id)
    if (publishedTask === null) {
      const result = await newPublishedTask.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updatePublishedTask(req: Request, res: Response): Promise<void> {
    const publishedTask = await PublishedTask.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (publishedTask === null) {
      res.sendStatus(404)
    } else {
      const updatedPublishedTask = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedPublishedTask })
    }
  }

  public async deletePublishedTask(req: Request, res: Response): Promise<void> {
    const publishedTask = await PublishedTask.findOneAndDelete({ _id: req.params.id })
    if (publishedTask === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'PublishedTask deleted Successfully' })
    }
  }
}
