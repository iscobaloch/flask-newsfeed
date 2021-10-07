from flask_sqlalchemy import SQLAlchemy
from main import datetime

db = SQLAlchemy()

class Tblcontact(db.Model):
    __tablename__ = 'contact'
    id = db.Column(db.Integer, primary_key=True)
    address = db.Column(db.String(150), nullable=False)
    phone = db.Column(db.String(15), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    fax = db.Column(db.String(15), nullable=True)

class TblAbout(db.Model):
    __tablename__ = 'about'
    id = db.Column(db.Integer, primary_key=True)
    about = db.Column(db.String(100), nullable=False)



class Category(db.Model):
    __tablename__= 'category'
    cid = db.Column(db.Integer, primary_key=True)
    cname = db.Column(db.String(80), nullable=False)


class Tblposts(db.Model):
    __tablename__ = 'posts'
    pid = db.Column(db.Integer, primary_key=True)
    pheading = db.Column(db.String(80), nullable=False)
    pdescription = db.Column(db.String(500), nullable=False)
    pthumbnail = db.Column(db.String(120), nullable=False)
    catid = db.Column(db.Integer)
    pdetails = db.Column(db.String(5000), nullable=True)
    ptime= db.Column(db.DATE, default=datetime.now())
    pubid=  db.Column(db.String(120), nullable=False)


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(200), nullable=False)

class Admin(db.Model):
    __tablename__='admin'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(200), nullable=False)