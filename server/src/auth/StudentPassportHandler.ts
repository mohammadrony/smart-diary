import passport from 'passport'
import passportLocal from 'passport-local'
// import passportApiKey from "passport-headerapikey";
import passportJwt from 'passport-jwt'
import { Student } from '../models/student.model'
import { JWT_SECRET } from '../util/secrets'

const LocalStrategy = passportLocal.Strategy
const JwtStrategy = passportJwt.Strategy
const ExtractJwt = passportJwt.ExtractJwt

passport.use(
  new LocalStrategy({ usernameField: 'email' }, (email: String, password: String, done: any) => {
    Student.findOne({ email: email.toLowerCase() }, (err: any, student: any) => {
      if (err) {
        return done(err)
      }
      if (!student) {
        return done(undefined, false, { message: `email ${email} not found.` })
      }
      student.comparePassword(password, (err: Error, isMatch: boolean) => {
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

passport.use(
  new JwtStrategy(
    {
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: JWT_SECRET,
    },
    function (jwtToken, done) {
      Student.findOne({ email: jwtToken.email }, function (err: any, student: any) {
        if (err) {
          return done(err, false)
        }
        if (student) {
          return done(undefined, student, jwtToken)
        } else {
          return done(undefined, false)
        }
      })
    }
  )
)
