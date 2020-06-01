# -*- coding: utf-8 -*-
"""
Created on Tue Mar 10 14:19:03 2020

@author: maria
"""

import resultanalysis
from flask import Flask, render_template, request

app = Flask(__name__)
r = resultanalysis.initialize()

@app.route('/', methods=['GET', 'POST'])
def form():
    return render_template('form.html')


@app.route('/results', methods=['GET', 'POST'])
def analyse():
    img = request.form["user_result"]
    return render_template("results.html", result="img")


if __name__ == "__main__":
    app.run()
