# -*- coding: utf-8 -*-
"""
Created on Tue Mar 10 14:19:03 2020

@author: maria
"""
import os
import resultanalysis
from flask import Flask, render_template, request
#commented out bits for file upload - work in progress
#from werkzeug.utils import secure_filename

#UPLOAD_FOLDER = '/user_files'
#ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
#app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/', methods=['GET', 'POST'])
def form():
    return render_template('form.html')


@app.route('/results', methods=['GET', 'POST'])
def analyse():
    #img = request.form["user_result"]
    return render_template("results.html", result="result")


if __name__ == "__main__":
    app.run()
