import bcrypt from 'bcrypt-nodejs'
import { NextFunction, Request, Response } from 'express'
import * as jwt from 'jsonwebtoken'
import passport from 'passport'
import '../auth/teacherPassport.handler'
import { Teacher } from '../models/teacher.model'
import { JWT_SECRET } from '../util/secrets'

export class teacherController {
  public async registerTeacher(req: Request, res: Response): Promise<void> {
    const hashedPassword = bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(10))

    await Teacher.create({
      email: req.body.email,
      password: hashedPassword,
    })

    const token = jwt.sign({ email: req.body.email, scope: req.body.scope }, JWT_SECRET)
    res.status(200).send({ token: token })
  }

  public authenticateTeacher(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('local', function (err, teacher, info) {
      // no async/await because passport works only with callback ..
      if (err) return next(err)
      if (!teacher) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        const token = jwt.sign({ email: teacher.email }, JWT_SECRET)
        res.status(200).send({ token: token })
      }
    })
  }
}
