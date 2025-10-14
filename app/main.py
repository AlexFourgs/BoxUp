from typing import Union

from fastapi import FastAPI

app = FastAPI(
    title="BOXTrain",
    version="0.0.1",
)


@app.get("/")
def get_root():
    return {"Hello": "World"}


def main():
    print("Hello from athleticaapi!")


if __name__ == "__main__":
    main()
