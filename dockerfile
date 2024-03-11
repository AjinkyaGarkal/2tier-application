FROM python:3.9-slim

WROKDIR /app

RUN apt-get update -y
   && apt-get upgrade -y \
   && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
   && rm -rf /var/lib/apt/lists/*

COPY requirments.txt .

RUN pip install mysqlclient
RUN pip install -r requirments.txt 

COPY . .

CMD ["python","app.py"]
