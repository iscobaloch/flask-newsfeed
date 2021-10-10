from flask import Flask
from models import *

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI']='postgres://sxlbimfcblaxsg:933392f77dee46ead42e658021f71f55548b3094bf9199a1e8d4a4163eb96936@ec2-3-209-65-193.compute-1.amazonaws.com:5432/d5altodeq2cn5f'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db.init_app(app)

def main():
    db.create_all()

if __name__ == "__main__":
    with app.app_context():
        main()
