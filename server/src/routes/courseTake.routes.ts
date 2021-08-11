import { Router } from 'express'
import { courseTakeController } from '../controllers/courseTake.controller'
import { authController } from '../controllers/auth.controller'

export class courseTakeRoutes {
  public router: Router
  public courseTakeController: courseTakeController = new courseTakeController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/courseTake
    this.router.get('/', this.courseTakeController.getCourseTakes)
    this.router.get('/:id', this.courseTakeController.getCourseTake)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.courseTakeController.createCourseTake
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTakeController.updateCourseTake
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTakeController.deleteCourseTake
    )
  }
}
