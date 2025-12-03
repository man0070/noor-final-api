# Dockerfile
FROM python:3.11-slim

# set working dir
WORKDIR /app

# copy requirements, then install
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# copy app
COPY app.py .

# expose port
EXPOSE 8000

# use gunicorn to serve the flask app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app", "--workers", "2", "--threads", "2"]
