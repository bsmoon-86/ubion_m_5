# flask 프레임 워크 안에 특정 기능들을 로드 
from flask import Flask, render_template, request, redirect
# mysql과 연동을 하는 라이브러리 로드 
import pymysql
import pymysql.cursors

# Flask라는 Class 생성
app = Flask(__name__)

# 함수 생성
# DB server와 연결하고 -> 가상공산 Cursor 생성 ->
# 매개변수 query문, data값을 이용하여 질의를 보내고 ->
# 결과 값을 받아오거나 DB서버에 동기화 -> 
# DB server와의 연결을 종료
def db_execute(query, *data):
    # 데이터베이스와 연결 (server 정보)
    _db = pymysql.connect(
        host = 'localhost', 
        port = 3306, 
        user = 'root', 
        password = '1234', 
        db = 'ubion' 
    )
    # 가상공간 Cursor 생성
    cursor = _db.cursor(pymysql.cursors.DictCursor)
    # 매개변수 query, data를 이용하여 질의 
    cursor.execute(query, data)
    # query가 select라면 결과값을 변수(result)에 저장 
    if query.strip().lower().startswith('select'):
        result = cursor.fetchall()
    # query가 select가 아니라면 DB server와 동기화하고 
    # 변수(result)는 Query OK 문자를 대입
    else:
        _db.commit()
        result = 'Query OK'
    # 데이터베이스 서버와의 연결을 종료
    _db.close()
    # 결과(result)를 되돌려준다.
    return result


# 메인페이지 api 생성 
# 로그인 화면 
@app.route("/")
def index():
    # 요청이 들어왔을 때 state라는 데이터가 존재하면 
    try:
        # 로그인이 실패한 경우
        _state = request.args['state']
    except:
        # 처음 로그인 화면을 로드한 경우
        _state = 1
    # login.html 되돌려준다. 
    return render_template('login.html', state = _state)

# 로그인 화면에서 id, password 데이터를 보내는 api 생성
@app.route("/main", methods=['post'])
def main():
    # 유저가 보낸 데이터 : id, password
    # 유저가 보낸 id값의 key -> input_id
    # 유저가 보낸 password값의 key -> input_pass
    print(request.form)
    _id = request.form['input_id']
    _pass = request.form['input_pass']
    # 받아온 데이터를 확인 
    print(f"/main[post] -> 유저 id : {_id}, password : {_pass}")
    # 유저가 보낸 데이터를 DB server에 table data와 비교
    login_query = """
        select 
        * 
        from 
        user 
        where 
        id = %s 
        and 
        password = %s
    """
    # 함수 호출
    db_result = db_execute(login_query, _id, _pass)
    # 로그인의 성공 여부 (조건식?? db_result가 존재하는가?)
    if db_result:
        # 로그인이 성공하는 경우 -> main.html을 되돌려준다. 
        # return render_template('main.html')
        return "login ok"
    else:
        # 로그인이 실패하는 경우 -> 로그인화면('/')으로 되돌아간다.
        # return redirect('/?state=2')
        return "login fail"



# 웹서버를 실행
app.run(debug=True)