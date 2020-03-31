FROM python:3.8-slim

WORKDIR /tmp

RUN apt-get -qq update && apt-get install -y build-essential \
    libssl-dev groff \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt

# set ROLE_ARN before calling
COPY assume-role-test.py .

CMD ["python", "assume-role.test.py"]
