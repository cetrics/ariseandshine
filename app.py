from flask import Flask, render_template, request, jsonify, redirect, url_for, abort,flash,session
import mysql.connector
from mysql.connector import Error
import os
from werkzeug.utils import secure_filename
from datetime import datetime
from flask_cors import CORS
import uuid
from flask import make_response

app = Flask(__name__)
CORS(app)

app.secret_key = 'your_secret_key'

# Dummy login credentials
USERNAME = 'admin'
PASSWORD = 'admin123'

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',             # default MySQL user in XAMPP
    'password': '',             # default password is empty
    'database': 'arise_and_shine'
}

# File upload configuration
UPLOAD_FOLDER = 'static/uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def get_db_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# ======== ROUTES ========
@app.route('/')
def indexPage():
    # Get 3 featured posts for main section
    featured_posts = get_blog_posts(page=1, per_page=3)[0]  # Get first 3 posts
    
    # Get 2 most recent posts for footer
    connection = get_db_connection()
    recent_posts = []
    if connection:
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute("""
                SELECT blog_id, blog_title, blog_author, blog_image, blog_time 
                FROM blog 
                ORDER BY blog_time DESC 
                LIMIT 2
            """)
            recent_posts = cursor.fetchall()
            
            # Format dates for footer section
            for post in recent_posts:
                post['formatted_date'] = post['blog_time'].strftime('%b %d, %Y')
                
        except Error as e:
            print(f"Error fetching recent posts: {e}")
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()
    
    return render_template("partials/home.html", 
                         posts=featured_posts, 
                         recent_posts=recent_posts)
@app.route('/')
def index():
    return render_template('index.html')

@app.route("/about")
def about():
    return render_template("partials/about.html")

@app.route("/trainer")
def trainer():
    return render_template("partials/teacher.html")

@app.route("/disability-support")
def disability():
    return render_template("partials/disability-support.html")    

@app.route("/child-care")
def child_care():
    return render_template("partials/child-care.html")     

@app.route("/therapy")
def therapy():
    return render_template("partials/therapy.html") 

@app.route("/hygiene-products")
def hygiene():
    return render_template("partials/hygiene-products.html") 

@app.route("/peanut-butter")
def peanut():
    return render_template("partials/peanut-butter.html") 

@app.route('/submit_contact', methods=['POST'])
def submit_contact():
    name = request.form.get('name')
    email = request.form.get('email')
    subject = request.form.get('subject')
    message = request.form.get('message')

    conn = get_db_connection()
    if conn:
        try:
            cursor = conn.cursor()
            sql = """
                INSERT INTO contact (contact_name, contact_email, contact_subject, contact_message)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(sql, (name, email, subject, message))
            conn.commit()
            return jsonify({'status': 'success', 'message': 'Message sent successfully!'})
        except Error as e:
            print("Error while inserting into MySQL", e)
            return jsonify({'status': 'danger', 'message': 'An error occurred while sending your message.'})
        finally:
            cursor.close()
            conn.close()
    else:
        return jsonify({'status': 'danger', 'message': 'Database connection failed.'})

@app.route("/contact")
def contact():
    return render_template("partials/contact.html")


@app.route("/subscribe", methods=["POST"])
def subscribe():
    data = request.get_json()
    email = data.get("email")

    if not email:
        return jsonify({'status': 'danger', 'message': 'Email is required'})

    conn = get_db_connection()
    if conn:
        try:
            cursor = conn.cursor()
            # Check if email already exists
            cursor.execute("SELECT id FROM subscribers WHERE email = %s", (email,))
            if cursor.fetchone():
                return jsonify({'status': 'warning', 'message': 'You are already subscribed!'})

            # Insert new subscriber
            cursor.execute("INSERT INTO subscribers (email) VALUES (%s)", (email,))
            conn.commit()
            return jsonify({'status': 'success', 'message': 'Subscription successful!'})
        except Error as e:
            print("Database error:", e)
            return jsonify({'status': 'danger', 'message': 'Error saving subscription.'})
        finally:
            cursor.close()
            conn.close()
    else:
        return jsonify({'status': 'danger', 'message': 'Database connection failed.'})

def get_blog_posts(page=1, per_page=10):
    connection = get_db_connection()
    if connection is None:
        return [], 0

    try:
        cursor = connection.cursor(dictionary=True)
        
        # Count total blog posts
        cursor.execute("SELECT COUNT(*) as total FROM blog")
        total_posts = cursor.fetchone()['total']

        # Calculate offset for pagination
        offset = (page - 1) * per_page

        query = """
            SELECT blog_id, blog_title, blog_body, blog_author, blog_image, blog_time 
            FROM blog 
            ORDER BY blog_time DESC 
            LIMIT %s OFFSET %s
        """
        cursor.execute(query, (per_page, offset))
        posts = cursor.fetchall()

        # Format date
        for post in posts:
            post['formatted_date'] = post['blog_time'].strftime('%d %B %Y')
            post['day'] = post['blog_time'].strftime('%d')
            post['month'] = post['blog_time'].strftime('%B')
            post['year'] = post['blog_time'].strftime('%Y')

        return posts, total_posts
    except Error as e:
        print(f"Error fetching blog posts: {e}")
        return [], 0
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

@app.route('/blog')
def blog():
    page = int(request.args.get('page', 1))
    per_page = 10
    posts, total_posts = get_blog_posts(page, per_page)
    total_pages = (total_posts + per_page - 1) // per_page
    return render_template('partials/blog.html', posts=posts, page=page, total_pages=total_pages)


@app.route('/blog/<int:post_id>')
def blog_single(post_id):
    connection = get_db_connection()
    if connection is None:
        return "Database connection error", 500
    
    try:
        cursor = connection.cursor(dictionary=True)
        query = """
            SELECT blog_id, blog_title, blog_body, 
                   blog_author, blog_image, blog_time 
            FROM blog 
            WHERE blog_id = %s
        """
        cursor.execute(query, (post_id,))
        post = cursor.fetchone()
        
        if post:
            # Format dates and image URL like in the blog() function
            post['formatted_date'] = post['blog_time'].strftime('%d %B %Y')
            post['day'] = post['blog_time'].strftime('%d')
            post['month'] = post['blog_time'].strftime('%B')
            post['year'] = post['blog_time'].strftime('%Y')
            post['image_url'] = url_for('static', filename=f"uploads/{post['blog_image']}") if post['blog_image'] else url_for('static', filename="images/default_blog.jpg")
            
            return render_template('blog_single.html', post=post)
        else:
            return "Post not found", 404
    except Error as e:
        print(f"Error fetching blog post: {e}")
        return "Error loading post", 500
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

# ======== ADMIN ROUTES ========
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username == USERNAME and password == PASSWORD:
            session['username'] = username
            return redirect('/admin')  # Redirect to /admin instead of /dashboard
        else:
            error = 'Invalid username or password'
    return render_template('admin/login.html', error=error)

@app.route('/logout')
def logout():
    session.clear()
    response = redirect(url_for('login'))
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
    return response


@app.route('/admin')
def admin():
    if 'username' not in session:
        return redirect(url_for('login'))

    response = make_response(render_template('admin/adminindex.html'))
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
    return response



@app.route('/<path:path>')
def catch_all(path):
    return render_template("admin/adminindex.html") 

# ======== BLOG MANAGEMENT ROUTES ========
@app.route("/upload-blog", methods=["POST"])
def upload_blog():
    connection = get_db_connection()
    cursor = None

    if not connection:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        if 'blog_image' not in request.files:
            return jsonify({"error": "No file part"}), 400

        file = request.files['blog_image']

        if file.filename == '':
            return jsonify({"error": "No selected file"}), 400

        if file and allowed_file(file.filename):
            original_filename = secure_filename(file.filename)
            # Generate a unique filename using UUID + extension
            extension = os.path.splitext(original_filename)[1]
            unique_filename = f"{uuid.uuid4().hex}{extension}"

            filepath = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
            file.save(filepath)

            blog_title = request.form.get('blog_title')
            blog_body = request.form.get('blog_body')
            blog_author = request.form.get('blog_author')

            cursor = connection.cursor()
            query = """
                INSERT INTO blog (blog_title, blog_body, blog_author, blog_image)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query, (blog_title, blog_body, blog_author, unique_filename))
            connection.commit()

            return jsonify({"success": True, "message": "Blog uploaded successfully"})
        else:
            return jsonify({"error": "Invalid file type"}), 400

    except Error as e:
        print(f"Error uploading blog: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()

@app.route("/get-blogs", methods=["GET"])
def get_blogs():
    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Database connection failed"}), 500
    
    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM blog ORDER BY blog_time DESC")
        blogs = cursor.fetchall()
        
        for blog in blogs:
            if 'blog_time' in blog:
                blog['blog_time'] = blog['blog_time'].strftime('%Y-%m-%d %H:%M:%S')
        
        return jsonify(blogs)
    except Error as e:
        print(f"Error fetching blogs: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

@app.route("/delete-blog/<int:blog_id>", methods=["DELETE"])
def delete_blog(blog_id):
    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Database connection failed"}), 500
    
    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT blog_image FROM blog WHERE blog_id = %s", (blog_id,))
        blog = cursor.fetchone()
        
        if not blog:
            return jsonify({"error": "Blog not found"}), 404
        
        cursor.execute("DELETE FROM blog WHERE blog_id = %s", (blog_id,))
        connection.commit()
        
        try:
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], blog['blog_image'])
            if os.path.exists(filepath):
                os.remove(filepath)
        except Exception as e:
            print(f"Warning: Could not delete image file: {e}")
        
        return jsonify({"success": True, "message": "Blog deleted successfully"})
    except Error as e:
        print(f"Error deleting blog: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

@app.route("/update-blog/<int:blog_id>", methods=["PUT"])
def update_blog(blog_id):
    connection = get_db_connection()
    if not connection:
        return jsonify({"error": "Database connection failed"}), 500
    
    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT blog_image FROM blog WHERE blog_id = %s", (blog_id,))
        current_blog = cursor.fetchone()
        current_image = current_blog['blog_image'] if current_blog else None
        
        if 'blog_image' in request.files:
            file = request.files['blog_image']
            if file.filename != '':
                if current_image:
                    try:
                        old_path = os.path.join(app.config['UPLOAD_FOLDER'], current_image)
                        if os.path.exists(old_path):
                            os.remove(old_path)
                    except Exception as e:
                        print(f"Warning: Could not delete old image: {e}")
                
                filename = secure_filename(file.filename)
                filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
                file.save(filepath)
                current_image = filename
        
        update_query = """
            UPDATE blog 
            SET blog_title = %s, 
                blog_author = %s, 
                blog_body = %s, 
                blog_image = %s,
                blog_time = NOW()
            WHERE blog_id = %s
        """
        cursor.execute(update_query, (
            request.form['blog_title'],
            request.form['blog_author'],
            request.form['blog_body'],
            current_image,
            blog_id
        ))
        connection.commit()
        
        return jsonify({"success": True, "message": "Blog updated successfully"})
    except Error as e:
        print(f"Error updating blog: {e}")
        return jsonify({"error": str(e)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

@app.route('/api/contacts', methods=['GET'])
def get_contacts():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute('SELECT * FROM contact')
    contacts = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(contacts)

def fetch_recent_posts(limit=2):
    connection = get_db_connection()
    recent_posts = []
    if connection:
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute("""
                SELECT blog_id, blog_title, blog_author, blog_image, blog_time 
                FROM blog 
                ORDER BY blog_time DESC 
                LIMIT %s
            """, (limit,))
            recent_posts = cursor.fetchall()
            for post in recent_posts:
                post['formatted_date'] = post['blog_time'].strftime('%b %d, %Y')
        except Error as e:
            print(f"Error fetching recent posts: {e}")
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()
    return recent_posts

@app.context_processor
def inject_recent_posts():
    return dict(recent_posts=fetch_recent_posts())


@app.route('/api/subscribers', methods=['GET'])
def get_subscribers():
    connection = get_db_connection()
    if connection:
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute("SELECT id, email, subscribed_at FROM subscribers ORDER BY subscribed_at DESC")
            subscribers = cursor.fetchall()
            return jsonify({'success': True, 'subscribers': subscribers})
        except Error as e:
            print(f"Error fetching subscribers: {e}")
            return jsonify({'success': False, 'error': str(e)}), 500
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()
    return jsonify({'success': False, 'error': 'Database connection failed'}), 500




if __name__ == "__main__":
    if not os.path.exists(UPLOAD_FOLDER):
        os.makedirs(UPLOAD_FOLDER)
    app.run(debug=True)