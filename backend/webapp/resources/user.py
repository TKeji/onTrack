from flask import request
from flask_restx import Resource
from flask_jwt_extended import create_access_token, create_refresh_token

from webapp.models.user import User

def validate_body(fields, json_body): 
    return all([field in json_body for field in fields])


class UserLogin(Resource): 
    def post(self): 
        # Validate json body 
        fields = 'email', 'password'
        json_payload = request.get_json(silent=True)
        if not validate_body(fields, json_payload): 
            return {'error': f'Must specify: {fields}'}

        # Get user 
        auth_user = User.find_by_email(json_payload['email']) 
        if not auth_user: 
            return {'error': 'User does not exist'}
        # Verify password 
        if not auth_user.verify_password(json_payload['password']): 
            return {'error': 'Incorrect password'}
        
        # Create token for user

        return {'data': {
            'msg': 'successfully signed in', 
            'access_token': create_access_token(identity=auth_user.id), 
            'refresh_token': create_refresh_token(identity=auth_user.id), 
        }}

        return {'error': f'Route {request.full_path} not up yet'}, 500


class UserRegister(Resource): 
    def post(self): 
        # Validate json body 
        fields = 'email', 'password', 'firstname', 'lastname'
        json_payload = request.get_json(silent=True)
        if not validate_body(fields, json_payload): 
            return {'error': f'Must specify: {fields}'}
        # Check if user with email already exists
        if User.find_by_email(json_payload['email']) is not None: 
            return {'error': f'{json_payload["email"]} already exists'}
        # Create user & save 
        new_user = User(**json_payload)
        new_user.save()

        return {'data': {'msg': 'user was successfully created', 'user_id': f'new_user.id'}}