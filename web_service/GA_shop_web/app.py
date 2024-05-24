from flask import Flask, render_template
from database import MyDB1

app = Flask(__name__)

# MyDB1 class 생성 
mydb = MyDB1()

@app.route("/")
def index():
    return render_template('index.html')

# 데이터베이스에 저장된 아이템의 목록을 보여주는 api 생성
@app.route('/shop')
def shop():
    # items table에 있는 모든 정보를 로드 
    items_select = """
        select * from items
    """
    # mydb를 이용하여 쿼리문을 실행
    db_result = mydb.sql_query(items_select)
    print(db_result)
    # html문서와 db_result변수를 결합하여 유저에게 되돌려준다. 
    return render_template('item_list.html', 
                           db_data = db_result)



app.run(debug=True)