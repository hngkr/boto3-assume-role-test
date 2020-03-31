FROM python:3.8-slim

WORKDIR /tmp

RUN apt-get -qq update && apt-get install -y build-essential \
    libssl-dev groff \
    && rm -rf /var/lib/apt/lists/*

RUN pip install boto3 requests

COPY assume-role-test.py .

# set ROLE_ARN before calling

CMD ["python", "test-assume-role.py"]
