from flask import Flask, render_template

# class 생성
app = Flask(__name__)

# api 생성
@app.route('/')
def index():
    # return 'Hello World'
    return render_template('index.html')

app.run()