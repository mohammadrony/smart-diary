import { Request, Response } from 'express'
import { ICourseTeach, CourseTeach } from '../models/courseTeach.model'

export class courseTeachController {
  public async getCourseTeaches(req: Request, res: Response): Promise<void> {
    const courseTeachs = await CourseTeach.find()
    res.json({ courseTeachs })
  }

  public async getCourseTeach(req: Request, res: Response): Promise<void> {
    const courseTeach = await CourseTeach.findById(req.params.id)
    if (courseTeach === null) {
      res.sendStatus(404)
    } else {
      res.json(courseTeach)
    }
  }

  public async createCourseTeach(req: Request, res: Response): Promise<void> {
    const newCourseTeach: ICourseTeach = new CourseTeach({
      CourseId: req.body.CourseId,
      TeacherId: req.user
    })
    const result = await newCourseTeach.save()
    if (result === null) {
      res.sendStatus(500)
    } else {
      res.status(201).json({ status: 201, data: result })
    }
  }

  public async updateCourseTeach(req: Request, res: Response): Promise<void> {
    const courseTeach = await CourseTeach.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (courseTeach === null) {
      res.sendStatus(404)
    } else {
      const updatedCourseTeach = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedCourseTeach })
    }
  }

  public async deleteCourseTeach(req: Request, res: Response): Promise<void> {
    const courseTeach = await CourseTeach.findOneAndDelete({ _id: req.params.id })
    if (courseTeach === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'CourseTeach deleted Successfully' })
    }
  }
}
