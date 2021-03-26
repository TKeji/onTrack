from flask import Flask, jsonify, Blueprint


def create_app(): 
    app = Flask(__name__)
    app.config.from_object('config.Config')

    from webapp.extensions import db, migrate, api, api_blueprint
    db.init_app(app)
    migrate.init_app(app, db)
    api.init_app(api_blueprint)
    app.register_blueprint(api_blueprint)


    with app.app_context(): 
        import webapp.models
        db.create_all()

    @app.route('/')
    def startup(): 
        return jsonify({'msg': 'Welcome to On-track'})

    @app.route('/recommend')
    def recommend(): 
        return {'msg': 'Recommend route incoming'}

    return app