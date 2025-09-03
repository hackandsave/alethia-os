from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
# In a real app, you would have separate router files.
# For simplicity in this single-file setup, we'll define a basic endpoint here.

app = FastAPI()

@app.get("/api/ping")
def ping():
    return {"ping": "pong"}

# This is the crucial part that serves your frontend
app.mount("/", StaticFiles(directory="www", html=True), name="static")
