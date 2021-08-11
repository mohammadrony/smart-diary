import bcrypt from 'bcrypt-nodejs'
import { NextFunction, Request, Response } from 'express'
import * as jwt from 'jsonwebtoken'
import passport from 'passport'
import '../auth/studentPassport.handler'
import { Student } from '../models/student.model'
import { JWT_SECRET } from '../util/secrets'

export class studentController {
  public async registerStudent(req: Request, res: Response): Promise<void> {
    const hashedPassword = bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10))

    await Student.create({
      email: req.body.email,
      role: req.body.role,
      password: hashedPassword,
    })

    const token = jwt.sign({ email: req.body.email, scope: req.body.scope }, JWT_SECRET)
    res.status(200).send({ token: token })
  }

  public authenticateStudent(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('local', function (err, student, info) {
      // no async/await because passport works only with callback ..
      if (err) return next(err)
      if (!student) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        const token = jwt.sign({ email: student.email }, JWT_SECRET)
        res.status(200).send({ token: token })
      }
    })
  }
}
