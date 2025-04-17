FROM python:3.10-slim

WORKDIR /src

COPY . .

# ✅ INSTALL dependencies one by one, in correct order
RUN pip install Werkzeug==2.2.2 && \
    pip install flask==2.2.2 && \
    pip install pytest==7.2.0

CMD ["python", "src/main.py"]
