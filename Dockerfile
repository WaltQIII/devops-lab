# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY app ./app

# Expose port and run app
CMD ["python", "app/app.py"]

EXPOSE 5000