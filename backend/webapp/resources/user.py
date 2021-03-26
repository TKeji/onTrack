from flask_restx import Resource


class UserLogin(Resource): 
    def get(self): 
        return {'error': 'this is a dummy route'}, 500

    def post(self): 
        return {'error': 'Route not up yet'}, 500


class UserRegister(Resource): 
    def post(self): 
        return {'error': 'Route not up yet'}, 500