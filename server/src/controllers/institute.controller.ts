import { Request, Response } from 'express'
import { IInstitute, Institute } from '../models/institute.model'

export class instituteController {
  public async getInstitutes(req: Request, res: Response): Promise<void> {
    const institutes = await Institute.find()
    res.json({ institutes })
  }

  public async getInstitute(req: Request, res: Response): Promise<void> {
    const institute = await Institute.findById(req.params.id)
    if (institute === null) {
      res.sendStatus(404)
    } else {
      res.json(institute)
    }
  }

  public async createInstitute(req: Request, res: Response): Promise<void> {
    const newInstitute: IInstitute = new Institute(req.body)
    const result = await newInstitute.save()
    if (result === null) {
      res.sendStatus(500)
    } else {
      res.status(201).json({ status: 201, data: result })
    }
  }

  public async updateInstitute(req: Request, res: Response): Promise<void> {
    const institute = await Institute.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (institute === null) {
      res.sendStatus(404)
    } else {
      const updatedInstitute = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedInstitute })
    }
  }

  public async deleteInstitute(req: Request, res: Response): Promise<void> {
    const institute = await Institute.findOneAndDelete({ _id: req.params.id })
    if (institute === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Institute deleted Successfully' })
    }
  }
}
