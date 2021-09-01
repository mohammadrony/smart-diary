import express from 'express'
import mongoose from 'mongoose'
import passport from 'passport'
const app = express()

if(process.env.NODE_ENV !== 'production'){
	require('dotenv').config()
}

import compression from 'compression'
import cors from 'cors'

import { MONGODB_URI } from './util/secrets'

import { courseRoutes } from './routes/course.routes'
import { courseTakeRoutes } from './routes/courseTake.routes'
import { courseTeachRoutes } from './routes/courseTeach.routes'
import { departmentRoutes } from './routes/department.routes'
import { instituteRoutes } from './routes/institute.routes'
import { noteMaterialRoutes } from './routes/noteMaterial.routes'
import { noteSubjectRoutes } from './routes/noteSubject.routes'
import { noteTopicRoutes } from './routes/noteTopic.routes'
import { publishedTaskRoutes } from './routes/publishedTask.routes'
import { studentRoutes } from './routes/student.routes'
import { taskRoutes } from './routes/task.routes'
import { teacherRoutes } from './routes/teacher.routes'
import { todoRoutes } from './routes/todo.routes'

require('./auth/userPassportHandler')(passport)

// class Server {
//   public app: express.Application

//   constructor() {
//     this.app = express()
//     this.config()
//     this.routes()
//     this.mongo()
//   }

  // public config(): void {
    app.set('port', process.env.PORT || 3000)
    app.use(express.json())
    app.use(express.urlencoded({ extended: true }))
    app.use(compression())
    app.use(cors())
    app.use(passport.initialize())
    app.use(passport.session())
  // }

  // public routes(): void {
    app.use('/api/course', new courseRoutes().router)
    app.use('/api/courseTake', new courseTakeRoutes().router)
    app.use('/api/courseTeach', new courseTeachRoutes().router)
    app.use('/api/department', new departmentRoutes().router)
    app.use('/api/institute', new instituteRoutes().router)
    app.use('/api/noteMaterial', new noteMaterialRoutes().router)
    app.use('/api/noteSubject', new noteSubjectRoutes().router)
    app.use('/api/noteTopic', new noteTopicRoutes().router)
    app.use('/api/publishedTask', new publishedTaskRoutes().router)
    app.use('/api/student', new studentRoutes().router)
    app.use('/api/task', new taskRoutes().router)
    app.use('/api/teacher', new teacherRoutes().router)
    app.use('/api/todo', new todoRoutes().router)
  // }

  // private mongo() {
    const connection = mongoose.connection
    connection.on('connected', () => {
      console.log('Mongo Connection Established')
    })
    connection.on('reconnected', () => {
      console.log('Mongo Connection Reestablished')
    })
    connection.on('disconnected', () => {
      console.log('Mongo Connection Disconnected')
      console.log('Trying to reconnect to Mongo ...')
      setTimeout(() => {
        mongoose.connect(MONGODB_URI, {
          useNewUrlParser: true,
          useUnifiedTopology: true,
          useCreateIndex: true,
          keepAlive: true,
          socketTimeoutMS: 3000,
          connectTimeoutMS: 3000,
        })
      }, 3000)
    })
    connection.on('close', () => {
      console.log('Mongo Connection Closed')
    })
    connection.on('error', (error: Error) => {
      console.log('Mongo Connection ERROR: ' + error)
    })
    mongoose.set('useNewUrlParser', true)
    mongoose.set('useFindAndModify', false)
    mongoose.set('useCreateIndex', true)
    mongoose.set('useUnifiedTopology', true)

    const run = async () => {
      await mongoose.connect(MONGODB_URI, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true,
        keepAlive: true,
      })
    }
    run().catch((error) => console.error(error))
  // }

  // public start(): void {
    app.listen(app.get('port'), () => {
      console.log('API is running at http://localhost:%d', app.get('port'))
    })
//   }
// }

// const server = new Server()

// server.start()
