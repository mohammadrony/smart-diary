import { Request, Response } from 'express'
import { IDepartment, Department } from '../models/department.model'

export class departmentController {
  public async getDepartments(req: Request, res: Response): Promise<void> {
    const departments = await Department.find({
      InstituteId: { $eq: req.params.instituteId }
    })
    res.json({ departments })
  }

  public async getDepartment(req: Request, res: Response): Promise<void> {
    const department = await Department.findById(req.params.id)
    if (department === null) {
      res.sendStatus(404)
    } else {
      res.json(department)
    }
  }

  public async createDepartment(req: Request, res: Response): Promise<void> {
    const newDepartment: IDepartment = new Department(req.body)
    
    const department = await Department.findById(req.body.id)
    if (department === null) {
      const result = await newDepartment.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateDepartment(req: Request, res: Response): Promise<void> {
    const department = await Department.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (department === null) {
      res.sendStatus(404)
    } else {
      const updatedDepartment = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedDepartment })
    }
  }

  public async deleteDepartment(req: Request, res: Response): Promise<void> {
    const department = await Department.findOneAndDelete({ _id: req.params.id })
    if (department === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Department deleted Successfully' })
    }
  }
}
