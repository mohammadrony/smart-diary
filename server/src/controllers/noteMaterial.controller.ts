import { Request, Response } from 'express'
import { INoteMaterial, NoteMaterial } from '../models/noteMaterial.model'

export class noteMaterialController {
  public async getNoteMaterials(req: Request, res: Response): Promise<void> {
    const noteMaterials = await NoteMaterial.find()
    res.json({ noteMaterials })
  }

  public async getNoteMaterial(req: Request, res: Response): Promise<void> {
    const noteMaterial = await NoteMaterial.findById(req.params.id)
    if (noteMaterial === null) {
      res.sendStatus(404)
    } else {
      res.json(noteMaterial)
    }
  }

  public async createNoteMaterial(req: Request, res: Response): Promise<void> {
    const newNoteMaterial: INoteMaterial = new NoteMaterial(req.body)
    
    const noteMaterial = await NoteMaterial.findById(req.body.id)
    if (noteMaterial === null) {
      const result = await newNoteMaterial.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateNoteMaterial(req: Request, res: Response): Promise<void> {
    const noteMaterial = await NoteMaterial.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (noteMaterial === null) {
      res.sendStatus(404)
    } else {
      const updatedNoteMaterial = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedNoteMaterial })
    }
  }

  public async deleteNoteMaterial(req: Request, res: Response): Promise<void> {
    const noteMaterial = await NoteMaterial.findOneAndDelete({ _id: req.params.id })
    if (noteMaterial === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'NoteMaterial deleted Successfully' })
    }
  }
}
