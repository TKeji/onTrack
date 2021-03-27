from webapp.extensions import ma
from marshmallow import fields

class UserSchema(ma.Schema): 
    password = fields.String(load_only=True)
    class Meta:
        fields = ['id','email', 'password', 'firstname', 'lastname']
        ordered = True

userSchema = UserSchema()
usersSchema = UserSchema(many=True)


class CourseSchema(ma.Schema): 
    class Meta: 
        fields = ['code', 'title', 'credits']
        ordered = True

courseSchema = CourseSchema()
coursesSchema = CourseSchema(many=True)