from webapp.extensions import ma
import marshmallow

class UserSchema(ma.Schema): 
    password = marshmallow.fields.String(load_only=True)
    class Meta:
        fields = ['id','email', 'password', 'firstname', 'lastname']
        ordered = True



class CourseSchema(ma.Schema): 
    class Meta: 
        fields = ['code', 'title', 'credits']
        ordered = True


class SessionSchema(ma.Schema): 
    class Meta: 
        fields = ['id', 'start_time', 'duration_s', 'course_code']
        ordered = True

    # TODO: GET the user information & course information onto the session schema - Currently not working
    # ! Can't make the user 
    user = marshmallow.fields.Nested('UserSchema')
        # user = fields.Nested(UserSchema)
        # course = ma.Nested(CourseSchema)


userSchema = UserSchema()
usersSchema = UserSchema(many=True)

courseSchema = CourseSchema()
coursesSchema = CourseSchema(many=True)

sessionSchema = SessionSchema()
sessionsSchema = SessionSchema(many=True)