from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/living-paper.html')
def living_paper():
    return render_template('living-paper.html')

@app.route('/bin-liners.html')
def bin_liners():
    return render_template('bin-liners.html')

@app.route('/gloves.html')
def gloves():
    return render_template('gloves.html')

@app.route('/packaging-products.html')
def packaging_products():
    return render_template('packaging-products.html')

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')

if __name__ == '__main__':
    app.run(debug=True)