from flask import Flask, flash, render_template, request, session, redirect, url_for, current_app
from werkzeug.utils import secure_filename
from sqlalchemy.sql.expression import func, select
import os
from passlib.hash import pbkdf2_sha256
from jinja2 import Markup
from datetime import datetime
import secrets
from models import *

app = Flask(__name__)

db = SQLAlchemy()
app.config['WTF_CSRF_SECRET_KEY'] = "b'f\xfa\x8b{X\x8b\x9eM\x83l\x19\xad\x84\x08\xaa"
app.config["SQLALCHEMY_DATABASE_URI"]="mysql+pymysql://admin:12345678@localhost:3306/newsfeed"
app.config['SECRET_KEY'] = "b'f\xfa\x8b{X\x8b\x9eM\x83l\x19\xad\x84\x08\xaa"
app.config['UPLOAD_FOLDER'] = '/home/wali/PycharmProjects/newsfeed/static/upload/thumbnail/'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Initialize 
db.init_app(app)


def save_images(photo):
    hash_photo= secrets.token_urlsafe(20)
    _, file_extension = os.path.splitext(photo.filename)
    photo_name= hash_photo + file_extension
    file_path= os.path.join(current_app.root_path, app.config['UPLOAD_FOLDER'], photo_name)
    photo.save(file_path)
    return photo_name

@app.route("/all-posts")
def all_posts():
    # # Contact US
    contact= Tblcontact.query.all()
    #latest 5 posts order by time
    # Nop stands for number of posts
    posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
    # random posts
    random = Tblposts.query.order_by(func.random()).all()
    count= Category.query.count()
    # Fetch all category
    posts_cat = Category.query.all()

    # c = db.session.query(Business, Category)\
    # .filter(Business.id == Category.cid
    # ).all()
    # print(c)
    return render_template('all-posts.html',posts =posts , random=random, contact=contact, count=count,posts_cat=posts_cat)


# HOME PAGE
@app.route("/")
def home():
    # Contact US
    contact= Tblcontact.query.all()
    #latest 5 posts order by time
    # Nop stands for number of posts
    posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
    # random posts
    random = Tblposts.query.order_by(func.random()).all()
    count= Category.query.count()
    # Fetch all category
    posts_cat = Category.query.all()
    return render_template('/index.html', posts=posts, random=random, contact=contact, count=count,posts_cat=posts_cat)

@app.route("/read-post/<id>", methods=['GET'])
def read_post(id):
    result = db.session.query(Tblposts, Category).filter(Tblposts.pid == id). \
        filter(Category.cid == Tblposts.catid).first()
    if result:
        # latest 5 posts order by time
        # Nop stands for number of posts
        posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
        # Nop stands for number of posts
        random = Tblposts.query.order_by(func.random()).all()
        # Fetch all category
        posts_cat = Category.query.all()
        db.session.query(Tblposts, Category, User).filter(Tblposts.catid == Category.cid). \
            filter(Tblposts.pubid == User.id).order_by(Tblposts.ptime.desc()).all()
        return render_template('read-post.html', posts=posts, result=result, random=random, posts_cat=posts_cat)
    else:
        return render_template('404.html')



@app.route("/read-category/<cat>", methods=['GET'])
def read_category(cat):
    # Contact US
    contact = Tblcontact.query.all()
    # latest 5 posts order by time
    posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
    # random posts
    random = Tblposts.query.order_by(func.random()).all()
    count = Category.query.count()
    # Fetch all category
    posts_cat = Category.query.all()
    # Where clause
    readcat =  db.session.query(Tblposts,Category).filter(Category.cname==cat).\
        filter(Tblposts.catid==Category.cid).all()

    return render_template('read-category.html',cat=cat,contact=contact, random=random, readcat=readcat,posts_cat=posts_cat, posts=posts)

@app.route("/dashboard")
def admin():
    if session.get('admin'):
        member=User.query.count()
        cats = Category.query.all()
        posts = db.session.query(Tblposts,Category).filter(Tblposts.catid==Category.cid).\
            order_by(Tblposts.ptime.desc()).all()
        return render_template("admin/index.html", posts=posts, cats=cats, member=member)
    elif session.get('mod'):
        member=User.query.count()
        cats = Category.query.all()
        posts = db.session.query(Tblposts,Category).filter(Tblposts.catid==Category.cid).\
            order_by(Tblposts.ptime.desc()).all()
        return render_template("mod/index.html", posts=posts, cats=cats, member=member)
    else:
        flash('LOGIN FIRST TO ACCESS DASHBOARD')
        return redirect(url_for('login'))



@app.route("/add-post", methods=['POST','GET'])
def add_post():
    if (session.get('admin') or session.get('mod')):
        cats = Category.query.all()
        if request.method == 'POST':
            pcategory = request.form.get('pcategory')
            pheading = request.form.get('pheading')
            pdescription = request.form.get('pdescription')
            pdetails = request.form.get('summernote')
            ptime = datetime.now()
            f = save_images(request.files.get('pthumbnail'))
            flash("THIS ARTICLE HAS BEEN PUBLISHED")

            if session.get('admin'):
                post = Tblposts(pubid=session.get('admin'), catid=pcategory, pheading=pheading, pthumbnail=f,
                                pdescription=pdescription,pdetails=pdetails, ptime=ptime)
                db.session.add(post)
                db.session.commit()
                return render_template("admin/add-post.html", cats=cats)
            else:
                post = Tblposts(pubid=session.get('mod'), catid=pcategory, pheading=pheading, pthumbnail=f,
                                pdescription=pdescription,
                                pdetails=pdetails, ptime=ptime)
                db.session.add(post)
                db.session.commit()
                return render_template("mod/add-post.html", cats=cats)
        if session.get('admin'):
            return render_template("admin/add-post.html", cats=cats)
        else:
            return render_template("mod/add-post.html", cats=cats)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")



@app.route("/new-moderator", methods=['POST','GET'])
def new_moderator():
    if session.get('admin'):
        if request.method == 'POST':
            name= request.form.get('name')
            username = request.form.get('username').lower().replace(" ","")
            email = request.form.get('email')
            passw = request.form.get('password')
            password = pbkdf2_sha256.hash(passw)
            cur= User.query.filter_by(username=username).first()
            if cur is None:
                mod= User(name=name,username=username,email=email,password=password)
                db.session.add(mod)
                db.session.commit()
                flash("NEW MODERATOR ADDED")
                return render_template("admin/new-mod.html")
            else:
                error = 'username already exist choose another!'
                return render_template("admin/new-mod.html", error=error)
        else:
            return render_template("admin/new-mod.html")
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")

@app.route("/update-moderator/id=<id>", methods=['POST','GET'])
def update_moderator(id):
    if session.get('admin'):
        mod = User.query.filter(User.id == id).first()
        if mod is None:
            return redirect(url_for('new_moderator'))
        else:
            if request.method == 'POST':
                name= request.form.get('name')
                username = request.form.get('username').lower().replace(" ","")
                email = request.form.get('email')
                passw = request.form.get('password')
                password=pbkdf2_sha256.hash(passw)
                mod= db.session.query(User).filter(User.id==id).first()
                mod.name=name
                mod.username=username
                mod.email=email
                mod.password=password
                db.session.commit()
                flash("Informaton Updated")
                return render_template("admin/update-mod.html", mod=mod)
            else:
                mod= User.query.filter(User.id==id).first()
                return render_template("admin/update-mod.html", mod=mod)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")

@app.route("/manage-moderators")
def view_moderators():
    if session.get('admin'):
        mods= User.query.all()
        return render_template("admin/view-mod.html",mods=mods)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")

@app.route("/update-moderator/action_delete=<id>")
def del_moderator(id):
    if session.get('admin'):
        mods= db.session.query(User).all()
        mod= db.session.query(User).filter(User.id==id).first()
        if mod is None:
            flash('Already Delete')
            return redirect(url_for('view_moderators'))
        else:
            db.session.delete(mod)
            db.session.commit()
            flash('Record has been Deleted')
            return redirect(url_for('view_moderators'))
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")


@app.route("/manage-posts")
def manage_posts():
    if session.get('admin'):
        posts = db.session.query(Tblposts,Category).filter(Tblposts.catid==Category.cid)\
            .order_by(Tblposts.ptime.desc()).all()
        cats = Category.query.all()
        return render_template("admin/manage-posts.html",cats=cats, posts=posts)
    elif session.get('mod'):
        posts = db.session.query(Tblposts, Category).filter(Tblposts.catid == Category.cid) \
            .order_by(Tblposts.ptime.desc()).all()
        cats = Category.query.all()
        return render_template("mod/manage-posts.html",cats=cats, posts=posts)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")


@app.route("/edit-post/id=<id>/action=edit", methods=['POST', 'GET'])
def edit_post(id):
    if session.get('admin'):
        if request.method == 'POST':
            thumb= request.files.get('pthumbnail')
            pheading= request.form.get("pheading")
            pdescription= request.form.get("pdescription")
            pcategory= request.form.get('pcategory')
            pdetails=request.form.get("summernote")
            hello= Tblposts.query.filter_by(pid=id).first()
            _, file_extension = os.path.splitext(thumb.filename)
            if ('.jpg' or '.jpeg' or '.png') in file_extension:
                updte = db.session.query(Tblposts).filter_by(pid=id).first()
                os.remove(app.config['UPLOAD_FOLDER']+updte.pthumbnail)
                updte.pheading = pheading
                updte.pdescription = pdescription
                updte.pthumbnail = save_images(request.files.get('pthumbnail'))
                updte.catid = pcategory
                updte.pdetails = pdetails
                db.session.commit()
                flash("CHANGES WERE MADE SUCCESSFULLY")
                return redirect(url_for('manage_posts'))
            else:
                updte = db.session.query(Tblposts).filter_by(pid=id).first()
                updte.pheading = pheading
                updte.pdescription = pdescription
                updte.pthumbnail = hello.pthumbnail
                updte.catid = pcategory
                updte.pdetails = pdetails
                db.session.commit()
                flash("POST AS BEEN UPDATED")
                return redirect(url_for('manage_posts'))
        else:
            cat = Category.query.all()
            posts = db.session.query(Tblposts,Category).filter(Tblposts.pid==id).first()
            return render_template("admin/edit-post.html", id=id,cat=cat, posts=posts)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return redirect(url_for('login'))

@app.route("/edit-post/action_delete=<int:id>", methods=['POST','GET'])
def delete_post(id):
    cats = Category.query.all()
    if session.get('admin'):
        post = db.session.query(Tblposts).filter(Tblposts.pid == id).first()
        if post is None:
            flash("This Item is Already Deleted")
            return redirect(url_for('manage_posts'))
        else:
            record= db.session.query(Tblposts).filter(Tblposts.pid == id).first()
            os.remove(app.config['UPLOAD_FOLDER']+record.pthumbnail)
            db.session.delete(record)
            db.session.commit()
            flash('Post Has been Deleted')
            return redirect(url_for('manage_posts'))
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")

@app.route("/add-category", methods=['POST','GET'])
def add_category():
    current = Category.query.all()
    if session.get('admin'):
        if request.method == 'POST':
            cats = request.form.get('cname').replace(" ","").lower()
            record = Category.query.filter(Category.cname==cats).first()
            if record:
                error = "Category Already Exist"
                return render_template("admin/add-category.html", error=error)
            else:
                cat = Category(cname=cats)
                db.session.add(cat)
                db.session.commit()
                flash('Category Added Successfully')
        return render_template("admin/add-category.html")
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")

@app.route("/manage-category")
def manage_category():
    if session.get('admin'):
        cats= db.session.query(Category).all()
        return render_template("admin/manage-category.html",cats=cats)
    else:
        return render_template("admin/login.html")

@app.route("/edit-category/action_id=<id>", methods=['POST','GET'])
def edit_category(id):
    if session.get('admin'):
        if request.method == 'POST':
            new=request.form.get("cname").lower().replace(" ","")
            exist= Category.query.filter_by(cname=new).first()
            if exist:
                error='CATEGORY ALREADY EXIST!'
                cat = db.session.query(Category).filter_by(cid=id).first()
                return render_template("admin/edit-category.html", id=id, cat=cat, error=error)
            else:
                b = db.session.query(Category).filter_by(cid=id).first()
                b.cname = new
                db.session.commit()
                flash("UPDATED SUCCESSFULLY")
                return redirect(url_for('manage_category'))
        else:
            cat= db.session.query(Category).filter_by(cid=id).first()
            return render_template("admin/edit-category.html",id=id, cat=cat)
    else:
        flash('LOGIN FIRST TO PROCEED')
    return redirect(url_for('login'))

@app.route("/edit-contact", methods=['POST','GET'])
def edit_contact():
    if session.get('admin'):
        contact= db.session.query(Tblcontact).order_by(Tblcontact.id.desc()).filter_by(id=Tblcontact.id).first()
        if request.method == 'POST':
            phone=request.form.get("contact")
            email = request.form.get("email")
            fax=request.form.get("fax")
            address=request.form.get("address")
            contact = db.session.query(Tblcontact).order_by(Tblcontact.id.desc()).filter_by(id=Tblcontact.id).first()
            contact.phone=phone
            contact.email=email
            contact.address=address
            contact.fax=fax
            db.session.commit()
            return render_template('admin/edit-contact.html', contact=contact)
        else:
            return render_template('admin/edit-contact.html', contact=contact)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return redirect(url_for('login'))

@app.route("/edit-about", methods=['POST','GET'])
def edit_about():
    if session.get('admin'):
        abt= db.session.query(TblAbout).first()
        if request.method == 'POST':
            new=request.form.get("summernote")
            abt = db.session.query(TblAbout).first()
            abt.about=new
            db.session.commit()
            return render_template('admin/edit-about.html', abt=abt)
        else:
            return render_template('admin/edit-about.html', abt=abt)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return redirect(url_for('login'))

@app.route("/manage-category/action_delete=<int:id>", methods=['POST','GET'])
def delete_category(id):
    cats = Category.query.all()
    if session.get('admin'):
        category = db.session.query(Category).filter(Category.cid
                                                     == id).first()
        if category is None:
            error ="NO RECORD FOUND"
            return render_template("admin/manage-category.html", cats=cats, error=error )
        else:
            record=  db.session.query(Category).filter(Category.cid==id).first()
            db.session.delete(record)
            db.session.commit()
            flash('Category Has been Deleted Successfully')
            return redirect(url_for('manage_category'))
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")


@app.route("/login" , methods=['POST','GET'])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        role= request.form.get('role').replace(" ","")
        if role=='admin':
            adm = Admin.query.filter_by(username=username).first()
            if pbkdf2_sha256.verify(password, adm.password):
                session['admin'] = adm.username
                session['id']= adm.id
                return redirect(url_for('admin'))
            else:
                error='Invalid Username or Password'
                return render_template("admin/login.html", error=error)
        else:
            mod= User.query.filter_by(username=username).first()
            if pbkdf2_sha256.verify(password, mod.password):
                session['mod'] = mod.username
                session['id'] = mod.id
                return redirect(url_for('admin'))
            else:
                error='Invalid Username or Password'
                return render_template("admin/login.html", error=error)
    else:
        return render_template("admin/login.html")





@app.route("/about-us")
def about():
    # Contact US
    contact = Tblcontact.query.order_by(Tblcontact.id.desc()).limit(1).all()
    # latest 5 posts order by time
    # Nop stands for number of posts
    posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
    # random posts
    random = Tblposts.query.order_by(func.random()).all()
    count = Category.query.count()
    # Fetch all category
    posts_cat = Category.query.all()
    about= TblAbout.query.order_by(TblAbout.id.desc()).limit(1).all()
    # c = db.session.query(Business, Category)\
    # .filter(Business.id == Category.cid
    # ).all()
    return render_template('/about.html', posts=posts, about=about, random=random, contact=contact, count=count,
                           posts_cat=posts_cat)

@app.route("/about-us=<id>", methods=['POST','GET'])
def about_edit(id):
    if session.get('admin'):
        if request.method=="POST":
            about= request.form.get('about')
            abt = TblAbout.query.filter(TblAbout.id == id).first()
            abt.about= about
            db.session.commit()
            flash('ABOUT UPDATED')
        else:
            abt = TblAbout.query.filter(TblAbout.id == id).first()
            if abt is None:
                return redirect(url_for('admin'))
            return render_template("admin/edit-about.html", abt=abt)
    else:
        flash('LOGIN FIRST TO PROCEED')
        return render_template("admin/login.html")


@app.route("/contact-us")
def contact():
    # Contact US
    contact = Tblcontact.query.order_by(Tblcontact.id.desc()).limit(1).all()
    # latest 5 posts order by time
    # Nop stands for number of posts
    posts = Tblposts.query.order_by(Tblposts.ptime.desc()).all()
    # random posts
    random = Tblposts.query.order_by(func.random()).all()
    count = Category.query.count()
    # Fetch all category
    posts_cat = Category.query.all()

    return render_template('/contact.html', posts=posts, random=random, contact=contact, count=count, posts_cat=posts_cat)


@app.route("/logout")
def logout():
    if session.get('admin'):
        session.clear()
        error= "YOUR SESSION HAS BEEN LOGGED OUT"
        return render_template(('/admin/login.html'), error=error)
    else:
        flash("You session is already logged out")
    return render_template(('/admin/login.html'))


# create  custom Error pages 
#Invalid URL

@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"),404

# Internal server error
@app.errorhandler(500)
def page_not_found(e):
    return render_template("500.html"),500


if __name__ == "__main__":

    app.run(debug=True)
