import bcrypt from 'bcryptjs'
import { NextFunction, Request, Response } from 'express'
import * as jwt from 'jsonwebtoken'
import passport from 'passport'
import '../auth/userPassportHandler'
import { Teacher } from '../models/teacher.model'
import { JWT_SECRET } from '../util/secrets'

export class teacherController {
  public async registerTeacher(req: Request, res: Response) {

    const teacher = await Teacher.create({
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    })

    const token = jwt.sign({ email: req.body.email, role: 'teacher' }, JWT_SECRET)
    const result = { token: token, teacherId: teacher._id }
    return res.status(200).send({ data: result })
  }

  public authenticateTeacher(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('teacherLocal', function (err, teacher, info) {
      // no async/await because passport works only with callback ..
      if (err) {
        // return next(err)
        return res.status(403).json({ status: 'error', code: 'authentication problem' })
      }
      if (!teacher) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        const token = jwt.sign({ email: teacher.email, role: 'teacher' }, JWT_SECRET)
        const result = { token: token, teacherId: teacher._id }
        return res.status(200).send({ data: result })
      }
    })(req, res, next)
  }
}
