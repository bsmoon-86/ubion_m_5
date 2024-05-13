from flask import Flask, request, render_template

app = Flask(__name__)

# index.html를 보여주는 api 생성
@app.route('/')
def index():
    return render_template('index.html')


app.run(debug=True)