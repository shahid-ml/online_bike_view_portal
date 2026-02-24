from flask import Flask, render_template
import psycopg2

app = Flask(__name__)

# ---------------- DATABASE CONFIG ---------------- #

DB_CONFIG = {
    "dbname": "online_bike_portal",
    "user": "postgres",
    "password": "011983",
    "host": "localhost",
    "port": "5432"
}

def get_db_connection():
    return psycopg2.connect(**DB_CONFIG)

# ---------------- HOME ROUTE ---------------- #

@app.route('/')
def home():
    conn = get_db_connection()
    cur = conn.cursor()

    # Fetch spotlight bikes
    cur.execute("""
        SELECT bike_id, name, price, image 
        FROM bike 
        WHERE spotlight = TRUE;
    """)

    bikes = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("index.html", bikes=bikes)

# ---------------- RUN APP ---------------- #

if __name__ == "__main__":
    app.run(debug=True)

































