import { Request, Response } from 'express'
import { ICourseTake, CourseTake } from '../models/courseTake.model'

export class courseTakeController {
  public async getCourseTakes(req: Request, res: Response): Promise<void> {
    const courseTakes = await CourseTake.find()
    res.json({ courseTakes })
  }

  public async getCourseTake(req: Request, res: Response): Promise<void> {
    const courseTake = await CourseTake.findById(req.params.id)
    if (courseTake === null) {
      res.sendStatus(404)
    } else {
      res.json(courseTake)
    }
  }

  public async createCourseTake(req: Request, res: Response): Promise<void> {
    const newCourseTake: ICourseTake = new CourseTake(req.body)
    const courseTake = await CourseTake.findById(req.body.id)
    if (courseTake === null) {
      const result = await newCourseTake.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateCourseTake(req: Request, res: Response): Promise<void> {
    const courseTake = await CourseTake.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (courseTake === null) {
      res.sendStatus(404)
    } else {
      const updatedCourseTake = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedCourseTake })
    }
  }

  public async deleteCourseTake(req: Request, res: Response): Promise<void> {
    const courseTake = await CourseTake.findOneAndDelete({ _id: req.params.id })
    if (courseTake === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'CourseTake deleted Successfully' })
    }
  }
}
