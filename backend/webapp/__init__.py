from flask import Flask, jsonify


def create_app(): 
    app = Flask(__name__)

    @app.route('/')
    def startup(): 
        return jsonify({'msg': 'Welcome to On-track'})

    @app.route('/recommend')
    def recommend(): 
        return {'msg': 'Recommend route incoming'}

    return app