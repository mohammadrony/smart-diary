import bcrypt from 'bcryptjs'
import { NextFunction, Request, Response } from 'express'
import * as jwt from 'jsonwebtoken'
import passport from 'passport'
import '../auth/userPassportHandler'
import { Student } from '../models/student.model'
import { JWT_SECRET } from '../util/secrets'

export class studentController {
  public async registerStudent(req: Request, res: Response) {

    const student = await Student.create({
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    })

    const token = jwt.sign({ email: req.body.email, role: 'student' }, JWT_SECRET)
    const result = { token: token, studentId: student._id }
    return res.status(200).send({ data: result })
  }

  public authenticateStudent(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('studentLocal', function (err, student, info) {
      // no async/await because passport works only with callback ..
      if (err) {
        // return next(err)
        return res.status(403).json({ status: 'error', code: 'authentication problem' })
      }
      if (!student) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        const token = jwt.sign({ email: student.email, role: 'student' }, JWT_SECRET)
        const result = { token: token, studentId: student._id }
        return res.status(200).send({ data: result })
      }
    })(req, res, next)
  }
}
