import os
import json
from dotenv import load_dotenv
import redis

load_dotenv()
r = redis.StrictRedis(
    host=os.getenv("REDIS_HOST"),
    port=int(os.getenv("REDIS_PORT")),
    password=os.getenv("REDIS_PASSWORD"),
    decode_responses=True
)

print("=== Chaves ===")
print(r.keys("*"))

print("\n=== product:1 ===")
print(json.dumps(json.loads(r.get("product:1")), indent=4))

print("\n=== product:2 ===")
print(json.dumps(json.loads(r.get("product:2")), indent=4))

print("\n=== product:1:ratings ===")
print(r.hgetall("product:1:ratings"))

print("\n=== Sorted Set temperature:sensor:1 ===")
print(r.zrange("temperature:sensor:1", 0, -1, withscores=True))

print("\n=== Tags ===")
for tag in r.keys("tag:*"):
    print(tag, r.smembers(tag))

print("\n=== Employees ===")
for emp in r.keys("employee:*"):
    print(emp, r.smembers(emp))
