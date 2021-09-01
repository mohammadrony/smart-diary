import passportLocal from 'passport-local'
// import passportApiKey from "passport-headerapikey";
import passportJwt from 'passport-jwt'
import { Student } from '../models/student.model'
import { Teacher } from '../models/teacher.model'
import { JWT_SECRET } from '../util/secrets'

const LocalStrategy = passportLocal.Strategy
const JwtStrategy = passportJwt.Strategy
const ExtractJwt = passportJwt.ExtractJwt

module.exports = function(passport: any) {
  passport.use('studentLocal',
    new LocalStrategy({ usernameField: 'email' }, (username: String, password: String, done: any) => {
      Student.findOne({ email: username.toLowerCase() }, (err: any, student: any) => {
        if (err) {
          return done(err)
        }
        if (!student) {
          return done(undefined, false, { message: `email ${username} not found.` })
        }
        student.comparePassword(password.toString(), student.password.toString(), (err: Error, isMatch: boolean) => {
          if (err) {
            return done(err)
          }
          if (isMatch) {
            return done(undefined, student)
          }
          return done(undefined, false, { message: 'Invalid email or password.' })
        })
      })
    })
  )

  passport.use('teacherLocal',
    new LocalStrategy({ usernameField: 'email' }, (username: String, password: String, done: any) => {
      Teacher.findOne({ email: username.toLowerCase() }, (err: any, teacher: any) => {
        if (err) {
          return done(err)
        }
        if (!teacher) {
          return done(undefined, false, { message: `email ${username} not found.` })
        }
        teacher.comparePassword(password.toString(), teacher.password.toString(), (err: Error, isMatch: boolean) => {
          if (err) {
            return done(err)
          }
          if (isMatch) {
            return done(undefined, teacher)
          }
          return done(undefined, false, { message: 'Invalid email or password.' })
        })
      })
    })
  )

  passport.use(
    new JwtStrategy(
      {
        jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: JWT_SECRET,
      }, function (jwtToken, done) {
        if(jwtToken.role == 'student'){
          Student.findOne({ email: jwtToken.email }, function (err: any, student: any) {
            if (err) {
              done(err, false)
            }
            if (student) {
            done(undefined, student, jwtToken)
            } else {
              done(undefined, false)
            }
          })
        }
        else if(jwtToken.role == 'teacher'){
          Teacher.findOne({ email: jwtToken.email }, function (err: any, teacher: any) {
            if (err) {
              done(err, false)
            }
            if (teacher) {
            done(undefined, teacher, jwtToken)
            } else {
              done(undefined, false)
            }
          })
        }
      }
    )
  )
}