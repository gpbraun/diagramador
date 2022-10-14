import psycopg2

conn = psycopg2.connect(
    host="192.168.0.54",
    port=5432,
    database="hedgedoc",
    user="hedgedoc",
    password="password",
)

cursor = conn.cursor()

print("Conectado")

cursor.execute(f'''SELECT * FROM "Notes"''')

query_results = cursor.fetchall()

print(query_results[0])
