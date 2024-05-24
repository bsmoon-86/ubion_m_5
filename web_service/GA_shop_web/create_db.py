import pymysql
import pymysql.cursors 

_db = pymysql.connect(
    host = '127.0.0.1', 
    port = 3306, 
    user = 'root', 
    password = '1234', 
    db = 'ubion'
)

cursor = _db.cursor(pymysql.cursors.DictCursor)

create_items_table = """
    CREATE TABLE 
    IF NOT EXISTS
    `items` (
        `No` int primary key auto_increment, 
        `name` varchar(64) not null, 
        `price` int not null, 
        `img_url` text
    )
"""

cursor.execute(create_items_table)
_db.commit()

# 데이터 삽입
insert_data = """
    insert into 
    `items`(`name`, `price`, `img_url`)
    values 
    ('[최저가데이] 하겐다즈 파인트/멀티바 3개 세트 [원산지:프랑스]', 
    29900, 
    'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg3.tmon.kr%2Fcdn4%2Fdeals%2F2024%2F01%2F14%2F25280844842%2Ffront_7fd7a_xkaul.jpg&type=sc960_832')
    ,(
    '[퍼실 300ml 증정] 헨켈 9중효소 세탁세제 퍼실 딥클린 파워젤 2.7L 2개', 
    27900, 
    'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fdnvefa72aowie.cloudfront.net%2Forigin%2Farticle%2F202401%2F9c51141cfe2a49a5c08eab1e8153f4f7e41979765c7dd092a2903f77972c671e.jpg%3Fq%3D95%26s%3D1440x1440%26t%3Dinside%26f%3Dwebp&type=sc960_832'
    ), 
    (
    '키첸 믹서기 진공 블렌더 초고속 대형', 
    309000, 
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMTZfMTE5%2FMDAxNzA4MDU5MDE1MDM1.dyOv68sCp1OQMPgzOakIccyhxQnA31jwxZsTWAmdCfsg.H5zIqYJyLg7lVlDv-xn3uBbERHKY6_ccTfn_kJAUmLEg.PNG.daraigreen%2Fimage.png&type=sc960_832'
    )
"""
cursor.execute(insert_data)
_db.commit()


_db.close()