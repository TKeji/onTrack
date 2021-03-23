from flask import Flask, jsonify


def create_app(): 
    app = Flask(__name__)
    app.config.from_object('config.Config')

    # TODO: Add a config file

    from webapp.extensions import db, migrate
    db.init_app(app)
    migrate.init_app(app, db)
    

    with app.app_context(): 
        import webapp.models
        print("creating all")
        db.create_all()

    @app.route('/')
    def startup(): 
        return jsonify({'msg': 'Welcome to On-track'})

    @app.route('/recommend')
    def recommend(): 
        return {'msg': 'Recommend route incoming'}

    return app