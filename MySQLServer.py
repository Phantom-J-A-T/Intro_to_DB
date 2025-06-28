import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

def connect_to_mysql():
    try:
        mydb = mysql.connector.connect(
        host=os.environ['DB_HOST'],
        user=os.environ['DB_USER'],
        password=os.environ['DB_PASSWORD'],
        database=os.environ['DB_NAME'],
)
        if mydb.is_connected():
            print("Successfully connected to the MySQL database")
            return mydb
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

def create_database(mydb):
    try:
        cursor = mydb.cursor()
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS alx_book_store")
        print(f"Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()