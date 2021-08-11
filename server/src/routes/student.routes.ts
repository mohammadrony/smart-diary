import { Router } from 'express'
import { studentController } from '../controllers/student.controller'

export class studentRoutes {
  router: Router
  public studentController: studentController = new studentController()

  constructor() {
    this.router = Router()
    this.routes()
  }
  routes() {
    // For TEST only ! In production, you should use an Identity Provider !!
    // - /api/student
    this.router.post('/register', this.studentController.registerStudent)
    this.router.post('/login', this.studentController.authenticateStudent)
  }
}
