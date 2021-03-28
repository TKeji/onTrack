from flask import Flask, jsonify, Blueprint


def create_app(): 
    app = Flask(__name__)
    app.config.from_object('config.Config')
    if app.config.get('ENV') != 'development': 
        print('In producttion')
        app.config.from_object('config.ProdConfig')

    from webapp.extensions import db, migrate, api, api_blueprint, jwt, ma
    db.init_app(app)
    migrate.init_app(app, db)
    jwt.init_app(app)
    ma.init_app(app)

    with app.app_context(): 
        import webapp.models
        print('created all')
        db.create_all()

    api.init_app(api_blueprint)
    app.register_blueprint(api_blueprint)
    @app.route('/')
    def startup(): 
        return jsonify({'msg': 'Welcome to On-track'})

    from flask_jwt_extended import jwt_required

    @app.route('/recommend')
    @jwt_required()
    def recommend(): 
        return {'msg': 'Recommend route incoming'}

    return app