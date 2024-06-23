from flask import Flask, render_template, send_from_directory
import os
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'your_username',
    'password': 'your_password',
    'database': 'camel_global'
}

def get_db_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error connecting to MySQL database: {e}")
    return None

@app.route('/')
@app.route('/home.html')
def home():
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT DISTINCT category FROM products")
        categories = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template('home.html', categories=categories)
    return render_template('home.html')  # Fallback to static content if DB connection fails

@app.route('/products.html')
def products():
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM products")
        products = cursor.fetchall()
        cursor.close()
        connection.close()
        return render_template('products.html', products=products)
    return render_template('products.html')  # Fallback to static content if DB connection fails

@app.route('/about.html')
def about():
    return render_template('about.html')

@app.route('/contact.html')
def contact():
    return render_template('contact.html')

@app.route('/living_paper.html')
def living_paper():
    products = get_products_by_category('Living Paper')
    return render_template('living_paper.html', products=products)

@app.route('/bin_liner.html')
def bin_liners():
    products = get_products_by_category('Bin Liners')
    return render_template('bin_liner.html', products=products)

@app.route('/gloves.html')
def gloves():
    products = get_products_by_category('Gloves')
    return render_template('gloves.html', products=products)

@app.route('/packaging_products.html')
def packaging_products():
    products = get_products_by_category('Packaging Products')
    return render_template('packaging_products.html', products=products)

def get_products_by_category(category):
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM products WHERE category = %s", (category,))
        products = cursor.fetchall()
        cursor.close()
        connection.close()
        return products
    return []  # Return empty list if DB connection fails

if __name__ == '__main__':
    app.run(debug=True)