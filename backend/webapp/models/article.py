from webapp.extensions import db 

from sqlalchemy.dialects.postgresql import TEXT

# Associatoin table
session_articles = db.Table('session_articles',
    db.Column('session_id', db.Integer, db.ForeignKey('session.id'), primary_key=True),
    db.Column('article_id', db.Integer, db.ForeignKey('article.id'), primary_key=True)
)



class Article(db.Model): 
    __tablename__ = 'article'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    author = db.Column(db.String(80))
    full_text = db.Column(TEXT, nullable=False)
    link = db.Column(db.String(250), nullable=False)

    sessions = db.relationship('Session', secondary=session_articles, lazy='subquery',
        backref=db.backref('articles', lazy=True))
    
    # many to many 


class ArticleRatings(db.Model): 
    __tablename__ = 'article_ratings'

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), primary_key=True)
    rating = db.Column(db.Integer, nullable=False)

    # __table_args__ = (
    #     db.PrimaryKeyConstraint('user_id', 'article_id'),
    # )
