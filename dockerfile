# ./Dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install dependencies (example)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# example command — replace with your app's start command
CMD ["python", "app.py"]
