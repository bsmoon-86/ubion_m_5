from flask import Flask, request, render_template

app = Flask(__name__)

# index.html를 보여주는 api 생성
@app.route('/')
def index():
    return render_template('index.html')

# form 태그를 이용하여 보낸 데이터를 받는 api
@app.route('/data')
def data():
    # get방식으로 들어온 데이터를 확인
    req = request.args
    print("form 태그를 이용한 요청 메시지 :", req)
    return ""

# ajax를 이용하여 보낸 데이터를 받는 api 
@app.route("/ajax_data")
def ajax_data():
    # get방식으로 들어온 데티터를 확인
    req = request.args 
    print("ajax를 이용한 요청 메시지 :", req)
    return "aaa"


app.run(debug=True)