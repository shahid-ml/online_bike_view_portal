from flask import Flask, render_template, request, redirect, session
import psycopg2

app = Flask(__name__)
app.secret_key = "secret123"

# DATABASE CONNECTION
conn = psycopg2.connect(
    host="localhost",
    database="online_bike_portal",
    user="postgres",
    password="root"
)

# ---------------- HOME PAGE ----------------
@app.route("/")
def home():

    search = request.args.get("search")

    cur = conn.cursor()

    if search:
        cur.execute(
            "SELECT * FROM bikes WHERE bike_name ILIKE %s",
            ('%' + search + '%',)
        )
    else:
        cur.execute("SELECT * FROM bikes")

    bikes = cur.fetchall()
    cur.close()

    return render_template("index.html", bikes=bikes)


# ---------------- OFFER PAGE ----------------
@app.route("/offer/<int:bike_id>")
def offer_page(bike_id):

    cur = conn.cursor()
    # FIX: Table name is 'bikes' (plural) and primary key is 'id' not 'bike_id'
    cur.execute(
        "SELECT * FROM bikes WHERE id = %s",
        (bike_id,)
    )

    bike = cur.fetchone()
    cur.close()

    return render_template("offer.html", bike=bike)


# ---------------- BRAND SEARCH ----------------
@app.route("/brand")
def brand():

    brand = request.args.get("brand")

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE brand ILIKE %s",
        ('%' + brand + '%',)
    )

    bikes = cur.fetchall()
    cur.close()

    return render_template("index.html", bikes=bikes)


# ---------------- BUDGET SEARCH ----------------
@app.route("/budget")
def budget():

    price = request.args.get("price")

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE price <= %s",
        (price,)
    )

    bikes = cur.fetchall()
    cur.close()

    return render_template("index.html", bikes=bikes)


# ---------------- LOGIN ----------------
@app.route("/login", methods=["POST"])
def login():

    username = request.form["username"]
    password = request.form["password"]

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM users WHERE username=%s AND password=%s",
        (username, password)
    )

    user = cur.fetchone()
    cur.close()

    if user:
        session["user"] = username

    return redirect("/")


# ---------------- REGISTER ----------------
@app.route("/register", methods=["POST"])
def register():

    username = request.form["username"]
    email = request.form["email"]
    password = request.form["password"]

    cur = conn.cursor()
    cur.execute(
        "INSERT INTO users(username, email, password) VALUES(%s, %s, %s)",
        (username, email, password)
    )
    conn.commit()
    cur.close()

    return redirect("/")


# ---------------- CATEGORY FILTER (for offer.html dropdown) ----------------
@app.route("/category/<cc>")
def category(cc):
    cur = conn.cursor()
    # This depends on your table structure - adjust as needed
    if cc == "100cc":
        cur.execute("SELECT * FROM bikes WHERE category LIKE '%100%' OR category LIKE '%110%' OR category LIKE '%125%'")
    elif cc == "150cc":
        cur.execute("SELECT * FROM bikes WHERE category LIKE '%150%' OR category LIKE '%200%'")
    elif cc == "250cc":
        cur.execute("SELECT * FROM bikes WHERE category LIKE '%250%' OR category LIKE '%300%'")
    elif cc == "350cc":
        cur.execute("SELECT * FROM bikes WHERE category LIKE '%350%' OR category LIKE '%400%' OR category LIKE '%390%'")
    elif cc == "Electric":
        cur.execute("SELECT * FROM bikes WHERE category LIKE '%Electric%'")
    else:
        cur.execute("SELECT * FROM bikes WHERE category LIKE %s", ('%' + cc + '%',))
    
    bikes = cur.fetchall()
    cur.close()
    return render_template("index.html", bikes=bikes)


# ---------------- RUN SERVER ----------------
if __name__ == "__main__":
    app.run(debug=True)