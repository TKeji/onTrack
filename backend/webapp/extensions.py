from flask import Blueprint
from flask_restx import Api
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from webapp.resources import UserLogin, UserRegister


db = SQLAlchemy()
migration = Migrate()
migrate = Migrate()
api = Api(perfix='/api')

# API endpoints 
api.add_resource(UserLogin, '/auth/login')
api.add_resource(UserRegister, '/auth/register')
api_blueprint = Blueprint('api', __name__, url_prefix='/api')