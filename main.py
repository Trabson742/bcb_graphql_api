from fastapi import FastAPI

app = FastAPI(title="BCB GraphQL API")


@app.get("/")
def read_root():
    return {"status": "API operacional", "projeto": "Bacen GraphQL"}
