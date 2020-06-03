# -*- coding: utf-8 -*-
"""
Created on Tue Mar 10 14:19:03 2020

@author: maria
"""
import os
import resultanalysis
from flask import Flask, flash, url_for, render_template, request, redirect, send_from_directory
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = './static/user_files'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
r = resultanalysis.initialize()

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024


@app.route('/', methods=['GET', 'POST'])
def show_form():
    return render_template('form.html')


@app.route('/result', methods=['POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            path_to_image = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(path_to_image)
            analysis = r.result_analysis(path_to_image)
            return render_template("results.html", result=parse_result(analysis), scroll="results",
                                   image_source=path_to_image)
    return redirect(request.url)


if __name__ == "__main__":
    app.run()


# verify if file submitted is of an allowed type
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# parse result array into human-readable text
def parse_result(result):
    valid = result[0][0]
    kpc = result[0][1]
    oxa = result[0][2]
    ndm = result[0][3]
    if valid == 1:
        return "The test is valid. The result for KPC is " + test_value(kpc) + ". The result for OXA is " + test_value(
            oxa) + ". The result for NDM is " + test_value(ndm) + "."
    return "The test was invalid"


# interpret test value
def test_value(value):
    tolerance = 0.1
    if 1 - tolerance < value < 1 + tolerance:
        return "positive"
    return "negative"
