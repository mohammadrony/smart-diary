import { Request, Response } from 'express'
import { ICourse, Course } from '../models/course.model'

export class courseController {
  public async getCourses(req: Request, res: Response): Promise<void> {
    const courses = await Course.find()
    res.json({ courses })
  }

  public async getCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findById(req.params.id)
    if (course === null) {
      res.sendStatus(404)
    } else {
      res.json(course)
    }
  }

  public async createCourse(req: Request, res: Response): Promise<void> {
    const newCourse: ICourse = new Course(req.body)
    const result = await newCourse.save()
    if (result === null) {
      res.sendStatus(500)
    } else {
      res.status(201).json({ status: 201, data: result })
    }
  }

  public async updateCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (course === null) {
      res.sendStatus(404)
    } else {
      const updatedCourse = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedCourse })
    }
  }

  public async deleteCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findOneAndDelete({ _id: req.params.id })
    if (course === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Course deleted Successfully' })
    }
  }
}
