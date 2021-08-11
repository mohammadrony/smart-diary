import passport from 'passport'
import passportLocal from 'passport-local'
// import passportApiKey from "passport-headerapikey";
import passportJwt from 'passport-jwt'
import { Teacher } from '../models/teacher.model'
import { JWT_SECRET } from '../util/secrets'

const LocalStrategy = passportLocal.Strategy
const JwtStrategy = passportJwt.Strategy
const ExtractJwt = passportJwt.ExtractJwt

passport.use(
  new LocalStrategy({ usernameField: 'email' }, (email: String, password: String, done: any) => {
    Teacher.findOne({ email: email.toLowerCase() }, (err: any, teacher: any) => {
      if (err) {
        return done(err)
      }
      if (!teacher) {
        return done(undefined, false, { message: `email ${email} not found.` })
      }
      teacher.comparePassword(password, (err: Error, isMatch: boolean) => {
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
    },
    function (jwtToken, done) {
      Teacher.findOne({ email: jwtToken.email }, function (err: any, teacher: any) {
        if (err) {
          return done(err, false)
        }
        if (teacher) {
          return done(undefined, teacher, jwtToken)
        } else {
          return done(undefined, false)
        }
      })
    }
  )
)
