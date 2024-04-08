## 기본적인 웹서버 설정 
## flask 웹프레임워크를 로드 
from flask import Flask, render_template

## Flask라는 Class 생성
## 생성자 함수 필수 인자 : 파일의 이름(app.py)
## __name__ : 현재 파일의 이름
app = Flask(__name__)

## 주소를 생성(api생성) -> 식당에서 메뉴를 만든다.
## localhost:5000/ 요청시 index 함수를 호출 
@app.route('/')
def index():
    # 문자열을 return 하는것이 아니라 html 문서를 리턴
    # return "Hello Flask"
    # render_template() : templates 폴더 안에 있는 html 문서를 호출
    return render_template('index.html')

## 주소를 생성
## localhost:5000/second
@app.route('/second')
def second():
    return "Second Page"



## Flask Class 안에 있는 함수(웹서버의 구동)를 호출 
app.run()