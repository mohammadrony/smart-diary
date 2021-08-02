import { Router } from 'express'
import { UserController } from '../controllers/UserController'

export class UserRoutes {
  router: Router
  public userController: UserController = new UserController()

  constructor() {
    this.router = Router()
    this.routes()
  }
  routes() {
    // For TEST only ! In production, you should use an Identity Provider !!
    // - /api/user
    this.router.post('/register', this.userController.registerUser)
    this.router.post('/login', this.userController.authenticateUser)
  }
}
