import { Router } from 'express'
import { instituteController } from '../controllers/institute.controller'
import { authController } from '../controllers/auth.controller'

export class instituteRoutes {
  public router: Router
  public instituteController: instituteController = new instituteController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/institute
    this.router.get('/', this.instituteController.getInstitutes)
    this.router.get('/:id', this.instituteController.getInstitute)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.instituteController.createInstitute
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.instituteController.updateInstitute
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.instituteController.deleteInstitute
    )
  }
}
