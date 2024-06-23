import mysql.connector

import connect


def get_db_connection(attempt_num=1, max_attempts=5):
    while attempt_num <= max_attempts:
        try:
            conn = mysql.connector.connect(
                user=connect.dbuser,
                password=connect.dbpass,
                host=connect.dbhost,
                database=connect.dbname,
                autocommit=True
            )
            return conn
        except mysql.connector.Error as err:
            print(f"Attempt {attempt_num}: Could not connect to MySQL server. Error: {err}")
            attempt_num += 1
    return None
