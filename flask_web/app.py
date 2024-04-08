## 기본적인 웹서버 설정 
## flask 웹프레임워크를 로드 
from flask import Flask, render_template, request, redirect
## module 로드 
import database

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
    # return "Second Page"
    return render_template('login.html')

## 주소를 생성(/login)
## 로그인 정보(request 메시지)를 받아오는 주소
@app.route('/login')
def login():
    # 해당 주소로 요청이 들어왔을때 (유저가 보낸 데이터가 포함)
    ## request.args는 유저가 서버에게 get 방식으로 보낸 데이터가 저장되어 있는 공간
    req = request.args
    print(req)
    ## 유저가 보낸 아이디 값을 변수에 저장 
    _id = req['input_id']
    ## 유저가 보낸 패스워드 값을 변수에 저장
    _pass = req['input_pass']
    print(f"유저가 보낸 id : {_id}, 비밀번호 : {_pass}")
    ## _id가 test이고 _pass가 1111 인 경우에는 로그인 성공 메시지 리턴
    if (_id == 'test') and (_pass == '1111'):
        return "로그인 성공"
    ## 아니라면 로그인 페이지(/second)로 되돌아간다.
    else:
        return redirect("/second")


## Flask Class 안에 있는 함수(웹서버의 구동)를 호출 
app.run(debug=True)