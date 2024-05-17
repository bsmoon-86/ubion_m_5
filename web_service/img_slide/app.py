# flask 웹 프레임워크 로드 
from flask import Flask, render_template, url_for
# database 안에 잇는 MyDB class 로드 
from static.python.database import MyDB
# Flask class 생성
app = Flask(__name__)
# MyDB class 생성
mydb = MyDB(
    '127.0.0.1', 
    3306, 
    'root', 
    '1234', 
    'ubion'
)

# localhost:5000/ api을 생성하여 img_slide.html를 되돌려주는 함수 생성
@app.route('/')
def slide():
    return render_template('img_slide.html')

# 웹서버를 실행
app.run(debug=True)