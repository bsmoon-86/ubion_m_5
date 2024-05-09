# flask 웹 프레임워크를 로드
# render_template() -> html문서를 유저에게 되돌려주기 위한 함수
#   templates 폴더 안에 있는 html 문서를 되돌려준다
#   html문서를 parsing 작업을 통해 유저에게 되돌려주는 형태
#   html 문서에서 {{변수명}}, {% python code %}를 사용 가능
#   f-string과 비슷한 기능
from flask import Flask, render_template

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
    return '<h1>Hello World</h1>'

# 새로운 api 생성 
# page1.html을 되돌려주는 api
@app.route('/first')
def first():
    # templates 폴더 안에 있는 page1.html 파일을 로드하여 
    # parsing
    print(render_template('page1.html', name = 'test'))
    print(type(render_template('page1.html', name = 'test')))
    return render_template('page1.html', name = 'test') 



# 웹 서버를 실행
# run() 함수는 매개변수 port의 기본값은 5000
app.run(port = 8080, debug=True)