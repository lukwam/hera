FROM python:3.11.1-slim

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

WORKDIR /workspace

ENTRYPOINT ["python", "main.py"]
