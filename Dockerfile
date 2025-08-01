# Dockerfile

# 1. Use official Python image
FROM python:3.11-slim

# 2. Install system dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# 3. Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 4. Set working directory
WORKDIR /app

# 5. Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 6. Copy project
COPY . .

# 7. Run the app
CMD ["python", "app/manage.py", "runserver", "0.0.0.0:8000"]
