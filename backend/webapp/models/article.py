from webapp.extensions import db 

from sqlalchemy.dialects.postgresql import TEXT


class Article(db.Model): 
    __tablename__ = 'article'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    author = db.Column(db.String(80))
    full_text = db.Column(TEXT, nullable=False)
    link = db.Column(db.String(250), nullable=False)
