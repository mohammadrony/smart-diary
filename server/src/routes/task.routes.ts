import { Router } from 'express'
import { taskController } from '../controllers/task.controller'
import { authController } from '../controllers/auth.controller'

export class taskRoutes {
  public router: Router
  public taskController: taskController = new taskController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/task
    this.router.get('/student',
      this.authController.authenticateJWT,
      this.taskController.getStudentTasks
    )
    this.router.get('/teacher',
      this.authController.authenticateJWT,
      this.taskController.getTeacherTasks
    )
    this.router.get('/:id',
      this.authController.authenticateJWT,
      this.taskController.getTask
    )
    this.router.post('/student', 
      this.authController.authenticateJWT,
      this.taskController.createStudentTask
    )
    this.router.post('/teacher', 
      this.authController.authenticateJWT,
      this.taskController.createTeacherTask
    )
    this.router.put('/:id',
      this.authController.authenticateJWT,
      this.taskController.updateTask
    )
    this.router.delete('/:id',
      this.authController.authenticateJWT,
      this.taskController.deleteTask
    )
  }
}
