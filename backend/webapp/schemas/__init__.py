from webapp.extensions import ma
from marshmallow import fields

class UserSchema(ma.Schema): 
    password = fields.String(load_only=True)
    class Meta:
        fields = ['id','email', 'password', 'firstname', 'lastname']
        ordered = True

userSchema = UserSchema()
usersSchema = UserSchema(many=True)