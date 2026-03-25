from flask import Flask, render_template, request, redirect,session
import psycopg2

app = Flask(__name__)
app.secret_key = "secret123"

# ---------------- DATABASE CONNECTION ----------------
conn = psycopg2.connect(
    host="localhost",
    database="online_bike_portal",
    user="postgres",
    password="root"
)

# ---------------- BIKE LATEST UPDATES ----------------
bike_updates = {

    "Yamaha R15": [
        "GST price reduction up to ₹17,581 improving affordability.",
        "10-Year Total Warranty programme launched by Yamaha India.",
        "Aerodynamic racing design inspired by MotoGP technology."
    ],

    "KTM Duke 200": [
        "Aggressive streetfighter styling with lightweight trellis frame.",
        "Improved braking stability and sharp acceleration.",
        "Perfect balance between performance and daily usability."
    ],

    "Royal Enfield Classic 350": [
        "New J-Series engine provides smoother ride experience.",
        "Reduced vibrations compared to previous generation.",
        "Retro classic design with modern engineering."
    ],

    "TVS Apache RTR 160": [
        "Race Tuned Fuel Injection technology for better performance.",
        "Glide Through Traffic feature for city riding.",
        "Sporty handling with strong pickup."
    ],

    "Yamaha MT 15": [
        "Dark Warrior styling inspired by MT series.",
        "VVA engine technology for power and efficiency.",
        "Lightweight chassis for quick maneuvering."
    ],

    "Bajaj Pulsar NS200": [
        "Triple spark DTS-i engine for powerful output.",
        "Perimeter frame improves corner stability.",
        "Sporty naked street performance bike."
    ],

    "Honda Hornet 2.0": [
        "Sharp aggressive design with LED lighting setup.",
        "Refined Honda engine reliability.",
        "Comfortable riding posture for daily commute."
    ]

}

# ---------------- AUTO BIKE UPDATES GENERATOR ----------------

def generate_updates(bike_name, brand, category):

    updates = []

    # -------- BRAND BASED --------
    if brand.lower() == "yamaha":
        updates.append("Advanced engine refinement improves performance and fuel efficiency.")
        updates.append("Sporty racing DNA inspired styling continues to attract young riders.")

    elif brand.lower() == "royal enfield":
        updates.append("Improved vibration control for smoother long-distance touring.")
        updates.append("Classic retro design combined with modern reliability upgrades.")

    elif brand.lower() == "ktm":
        updates.append("High-performance engine tuned for aggressive acceleration.")
        updates.append("Lightweight chassis enhances cornering stability.")

    elif brand.lower() == "honda":
        updates.append("Honda reliability with refined engine performance.")
        updates.append("Improved mileage and smooth city riding experience.")

    elif brand.lower() == "tvs":
        updates.append("Race-derived technology enhances throttle response.")
        updates.append("Balanced suspension setup for daily commuting comfort.")

    elif brand.lower() == "bajaj":
        updates.append("DTS-i technology ensures powerful yet efficient riding.")
        updates.append("Sporty styling with improved braking confidence.")

    # -------- CATEGORY BASED --------
    if category and "Electric" in category:
        updates.append("Extended battery range with improved charging efficiency.")
        updates.append("Eco-friendly zero emission mobility solution.")

    elif category and "100" in category:
        updates.append("Excellent mileage focused commuter motorcycle.")
        updates.append("Low maintenance cost ideal for daily riders.")

    elif category and "125" in category:
        updates.append("Perfect balance between mileage and performance.")
        updates.append("Comfortable riding ergonomics for city usage.")

    elif category and "200" in category:
        updates.append("Strong mid-range power suitable for highways.")
        updates.append("Sport-focused handling and braking performance.")

    elif category and "350" in category:
        updates.append("Torque-rich engine designed for relaxed cruising.")
        updates.append("Premium road presence with stable ride quality.")

    elif category and "400" in category:
        updates.append("High displacement engine built for touring performance.")
        updates.append("Enhanced stability at higher speeds.")

    # -------- DEFAULT --------
    updates.append("Latest model features updated styling and improved ride quality.")

    return updates

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

# ---------------- SEARCH ----------------
@app.route('/search')
def search_bike():

    value = request.args.get('bike')

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE LOWER(bike_name) LIKE %s",
        ('%' + value.lower() + '%',)
    )

    bikes = cur.fetchall()
    cur.close()

    return render_template('index.html', bikes=bikes)

@app.route("/search")
def search():
    bike_name = request.args.get("bike")

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE bike_name ILIKE %s",
        ('%' + bike_name + '%',)
    )

    bikes = cur.fetchall()

    return render_template("index.html", bikes=bikes)

@app.route("/brand")
def search_brand():
    brand = request.args.get("brand")

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE brand ILIKE %s",
        (brand,)
    )

    bikes = cur.fetchall()

    return render_template("index.html", bikes=bikes)

@app.route("/budget")
def search_budget():
    price = request.args.get("price")

    cur = conn.cursor()
    cur.execute(
        "SELECT * FROM bikes WHERE price <= %s",
        (price,)
    )

    bikes = cur.fetchall()

    return render_template("index.html", bikes=bikes)

@app.route("/offer/<int:bike_id>")
def offer_page(bike_id):

    cur = conn.cursor()
    cur.execute("SELECT * FROM bikes WHERE id=%s", (bike_id,))
    bike = cur.fetchone()
    cur.close()

    # bike structure:
    # [0]=id
    # [1]=bike_name
    # [2]=brand
    # [3]=price
    # [4]=image
    # [5]=category

    updates = generate_updates(
        bike[1],
        bike[2],
        bike[5]
    )

    return render_template(
        "offer.html",
        bike=bike,
        updates=updates
    )

# ---------------- BRAND SEARCH ----------------
@app.route('/brand/<brand_name>')
def bikes_by_brand(brand_name):

    cur = conn.cursor()

    query = "SELECT * FROM bikes WHERE LOWER(brand) LIKE %s"
    cur.execute(query, ('%' + brand_name.lower() + '%',))

    bikes = cur.fetchall()
    cur.close()

    return render_template('index.html', bikes=bikes)


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
        "INSERT INTO users(username, email, password) VALUES(%s,%s,%s)",
        (username, email, password)
    )
    conn.commit()
    cur.close()

    return redirect("/")


# ---------------- CATEGORY FILTER ----------------
@app.route("/category/<cc>")
def category(cc):

    cur = conn.cursor()

    cur.execute(
        "SELECT * FROM bikes WHERE category ILIKE %s",
        ('%' + cc + '%',)
    )

    bikes = cur.fetchall()
    cur.close()

    return render_template("index.html", bikes=bikes)


# ---------------- RUN SERVER ----------------
if __name__ == "__main__":
    app.run(debug=True)

    