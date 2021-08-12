import { Router } from 'express'
import { departmentController } from '../controllers/department.controller'
import { authController } from '../controllers/auth.controller'

export class departmentRoutes {
  public router: Router
  public departmentController: departmentController = new departmentController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/department
    this.router.get('/:instituteId', this.departmentController.getDepartments)
    this.router.get('/:id', this.departmentController.getDepartment)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.departmentController.createDepartment
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.departmentController.updateDepartment
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.departmentController.deleteDepartment
    )
  }
}
