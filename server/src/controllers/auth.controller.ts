import { NextFunction, Request, Response } from 'express'
import passport from 'passport'
import '../auth/userPassportHandler'

export class authController {
  public authenticateJWT(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('jwt', function (err, user, info) {
      if (err) {
        // return next(err)
        return res.status(403).json({ status: 'error', code: 'authorization problem' })
      }
      if (!user) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        req.user = user
        return next()
      }
    })(req, res, next)
  }

  public authorizeJWT(req: Request, res: Response, next: NextFunction) {
    passport.authenticate('jwt', function (err, user, jwtToken) {
      if (err) {
        // return next(err)
        return res.status(403).json({ status: 'error', code: 'authorization problem' })
      }
      if (!user) {
        return res.status(401).json({ status: 'error', code: 'unauthorized' })
      } else {
        const scope = req.baseUrl.split('/').slice(-1)[0]
        const authScope = jwtToken.scope
        if (authScope && authScope.indexOf(scope) > -1) {
          return next()
        } else {
          return res.status(401).json({ status: 'error', code: 'unauthorized' })
        }
      }
    })(req, res, next)
  }
}
