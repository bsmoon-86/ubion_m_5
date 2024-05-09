# flask 웹 프레임워크를 로드
from flask import Flask

# Flask class 생성
# 생성자 함수에 필수 인자 값 : 1개
#   파일의 이름(app.py -> __name__)
app = Flask(__name__)

# api 생성
# router : 네이게이터 함수 
# route()함수 안에 인자값과 루트주소와 
# 연결된 주소 값으로 요청 시 아래의 함수를 호출
# ex) @app.route('/view_info') --> localhost:8080/view_info 주소로 요청시
@app.route('/')
def index():
    return 'Hello World'


# 웹 서버를 실행
# run() 함수는 매개변수 port의 기본값은 5000
app.run(port = 8080, debug=True)