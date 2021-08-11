import { Router } from 'express'
import { teacherController } from '../controllers/teacher.controller'

export class teacherRoutes {
  router: Router
  public teacherController: teacherController = new teacherController()

  constructor() {
    this.router = Router()
    this.routes()
  }
  routes() {
    // For TEST only ! In production, you should use an Identity Provider !!
    // - /api/teacher
    this.router.post('/register', this.teacherController.registerTeacher)
    this.router.post('/login', this.teacherController.authenticateTeacher)
  }
}
