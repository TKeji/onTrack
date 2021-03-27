from flask import request
from flask_restx import Resource
from flask_jwt_extended import create_access_token, create_refresh_token

from webapp.models.user import User
from webapp.schemas import userSchema, usersSchema, coursesSchema, courseSchema

def validate_body(fields, json_body): 
    return all([field in json_body for field in fields])


class UserResource(Resource): 
    def get(self, user_id): 
        # Get suer from db 
        print(user_id)
        user = User.find_by_id(user_id)
        if not user: 
            return {'error': f'User with id {user_id} not found '}, 400
        return {'data': userSchema.dump(user)}
        
    
    def put(self, user_id): 
        # Editable fields 
        req_body = request.get_json(silent=True)
        try:
            user_changes = userSchema.load(req_body)
        except Exception as e:
            print(e) 
            return {'error': 'invalid fields to change'}, 400
        # Get the user 
        user = User.find_by_id(user_id)
        if not user: 
            return {'error': f'User with id {user_id} does not exist'}, 400
        for field, value in user_changes.items(): 
            setattr(user, field, value)
        user.save() 
        return {'msg': 'user details updated'} 

    def delete(self, user_id): 
        try: 
            User.remove_by_id(user_id)
        except Exception as  e: 
            print(e)
            return {'msg': 'unable to delete user'}
        
        return {'msg': 'user deleted'}, 204

class UsersResource(Resource): 
    # TODO: Deal with Query parameters
    def get(self): 
        # get all users 
        users = User.get_users()
        print(users)
        return {f'data': 
            usersSchema.dump(users)
        }


class UserLogin(Resource): 
    def post(self): 
        # Validate json body 
        fields = 'email', 'password'
        json_payload = request.get_json(silent=True)
        if not validate_body(fields, json_payload): 
            return {'error': f'Must specify: {fields}'}, 400

        # Get user 
        auth_user = User.find_by_email(json_payload['email']) 
        if not auth_user: 
            return {'error': 'User does not exist'}
        # Verify password 
        if not auth_user.verify_password(json_payload['password']): 
            return {'error': 'Incorrect password'}, 400
        
        # Create token for user

        return {'data': {
            'msg': 'successfully signed in', 
            'user_id': auth_user.id,
            'access_token': create_access_token(identity=auth_user.id), 
            'refresh_token': create_refresh_token(identity=auth_user.id), 
        }}



class UserRegister(Resource): 
    def post(self): 
        # Validate json body 
        fields = 'email', 'password', 'firstname', 'lastname'
        json_payload = request.get_json(silent=True)
        if not validate_body(fields, json_payload): 
            return {'error': f'Must specify: {fields}'}, 400
        # Check if user with email already exists
        if User.find_by_email(json_payload['email']) is not None: 
            return {'error': f'{json_payload["email"]} already exists'}, 400
        # Create user & save 
        new_user = User(**json_payload)
        new_user.save()

        return {'data': {'msg': 'user was successfully created', 'user_id': f'{new_user.id}'}}



class UserCoursesResource(Resource):
    def get(self, user_id): 
        try: 
            user = User.find_by_id(user_id)
            courses = user.get_courses()
            courses_json = coursesSchema.dump(courses)
        except Exception as e: 
            print(e)
            return {'error': f'unable to get courses for user {user_id}'}, 500
        return {'data': 
            courses_json
        }
    

class UserCourseResource(Resource): 
    def post(self, user_id, course_code): 
        try: 
            user = User.find_by_id(user_id)
            user.add_course(course_code)
        except Exception as e: 
            print(e)
            return {'error': 'unable to add course to user'}, 500
        return {'msg': 'Added course to user'}
    
    def delete(self, user_id, course_code): 
        try: 
            user = User.find_by_id(user_id)
            user.remove_course(course_code)
        except Exception as e: 
            print(e)
            return {'error': 'unable to remove course from user'}, 500
        
        return {'msg': f'removed course {course_code}'}