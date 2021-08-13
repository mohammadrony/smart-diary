import { Router } from 'express'
import { noteMaterialController } from '../controllers/noteMaterial.controller'
import { authController } from '../controllers/auth.controller'

export class noteMaterialRoutes {
  public router: Router
  public noteMaterialController: noteMaterialController = new noteMaterialController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/noteMaterial
    this.router.get('/', this.noteMaterialController.getNoteMaterials)
    this.router.get('/:id', this.noteMaterialController.getNoteMaterial)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.noteMaterialController.createNoteMaterial
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteMaterialController.updateNoteMaterial
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteMaterialController.deleteNoteMaterial
    )
  }
}
