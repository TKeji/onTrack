from flask import Blueprint
from flask_restx import Api
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager
from flask_marshmallow import Marshmallow


db = SQLAlchemy()
migration = Migrate()
migrate = Migrate()
api = Api(perfix='/api')
jwt = JWTManager()
ma = Marshmallow()

# API endpoints 
from webapp.resources import (UserLogin, UserRegister, 
                                UserResource, UsersResource, 
                                CoursesResource, UserCoursesResource, UserCourseResource,
                                UserSessionResource)
api.add_resource(UserLogin, '/auth/login')
api.add_resource(UserRegister, '/auth/register')
api.add_resource(CoursesResource, '/courses')
api.add_resource(UsersResource, '/users')
api.add_resource(UserResource, '/users/<string:user_id>')
api.add_resource(UserCoursesResource, '/users/<string:user_id>/courses')
api.add_resource(UserCourseResource, '/users/<string:user_id>/courses/<string:course_code>')
api.add_resource(UserSessionResource, '/users/<string:user_id>/sessions')
api_blueprint = Blueprint('api', __name__, url_prefix='/api')