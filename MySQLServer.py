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
            print(f"Database {os.environ['DB_NAME']} created successfully!")
            return mydb
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

