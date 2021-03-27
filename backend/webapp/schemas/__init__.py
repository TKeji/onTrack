import marshmallow

from webapp.extensions import ma
from webapp.models.article import Article

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
    # user = marshmallow.fields.Nested('UserSchema')
        # user = fields.Nested(UserSchema)
        # course = ma.Nested(CourseSchema)


class ArticleSchema(ma.SQLAlchemySchema): 
    class Meta: 
        model = Article
    id = ma.auto_field(dump_only=True)
    title = ma.auto_field()
    author = ma.auto_field()
    full_text = ma.auto_field()
    link = ma.auto_field()



userSchema = UserSchema()
usersSchema = UserSchema(many=True)

courseSchema = CourseSchema()
coursesSchema = CourseSchema(many=True)

sessionSchema = SessionSchema()
sessionsSchema = SessionSchema(many=True)

articleSchema = ArticleSchema()
articlesSchema = ArticleSchema(many=True)