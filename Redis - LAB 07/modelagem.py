"""
Script de modelagem Redis - Padrões comuns de design.
Autor: Guilherme Muniz
Data: 2025-08-14

Este script conecta-se ao Redis Cloud e implementa vários padrões de modelagem,
seguindo boas práticas
"""
import os
from dotenv import load_dotenv
import redis
import json
from datetime import datetime

# Carrega variáveis do .env
load_dotenv()

HOST = os.getenv("REDIS_HOST")
PORT = int(os.getenv("REDIS_PORT"))
PASSWORD = os.getenv("REDIS_PASSWORD")

r = redis.StrictRedis(host=HOST, port=PORT, password=PASSWORD, decode_responses=True)
print(r.ping())  

# -------------------------
# Padrão 1: Embedded Pattern
# -------------------------

product = {
    "name": "Smartphone X",
    "price": 3999,
    "details": {
        "manufacturer": "TechCorp",
        "storage": "128GB",
        "color": "Black"
    }
}
r.set("product:1", json.dumps(product))

# -------------------------
# Padrão 2: Partial Embed Pattern
# -------------------------

product_with_reviews = {
    "name": "Laptop Ultra",
    "price": 7999,
    "recent_reviews": [
        {"user": "Alice", "rating": 5, "comment": "Excelente desempenho!"},
        {"user": "Bob", "rating": 4, "comment": "Ótimo, mas bateria poderia ser melhor."}
    ]
}
r.set("product:2", json.dumps(product_with_reviews))

# -------------------------
# Padrão 3: Aggregate Pattern
# -------------------------

r.hset("product:1:ratings", mapping={"total_reviews": 2, "sum_ratings": 9})

# -------------------------
# Padrão 4: Polymorphic Pattern
# -------------------------

r.set("product:3", json.dumps({
    "type": "game_console",
    "name": "GameBox",
    "storage": "1TB",
    "hdmi_ports": 2
}))
r.set("product:4", json.dumps({
    "type": "earbuds",
    "name": "SoundBuds",
    "battery_life": "10h",
    "connection_type": "Bluetooth"
}))

# -------------------------
# Padrão 5: Bucket Pattern
# -------------------------

now = datetime.now().isoformat()
r.zadd("temperature:sensor:1", {now: 22.5})
r.zadd("temperature:sensor:1", {datetime.now().isoformat(): 23.1})

# -------------------------
# Padrão 6: Tree and Graph Pattern
# -------------------------

r.sadd("employee:1:reports_to", "employee:2", "employee:3")
r.sadd("employee:2:reports_to", "employee:4")

# -------------------------
# Padrão 7: Revision Pattern
# -------------------------

post = {
    "title": "Guia Redis",
    "body": "Conteúdo inicial...",
    "revisions": [
        {"title": "Guia Redis", "body": "Conteúdo atualizado 1"},
        {"title": "Guia Redis", "body": "Conteúdo atualizado 2"}
    ]
}
r.set("post:1", json.dumps(post))

# -------------------------
# Padrão 8: Schema Version Pattern
# -------------------------

user_v1 = {
    "schema": "1",
    "name": "Carlos",
    "email": "carlos@email.com"
}
r.set("user:1", json.dumps(user_v1))

print("Modelagem concluída com sucesso.")
