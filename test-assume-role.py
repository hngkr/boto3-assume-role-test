import os
import pprint
import boto3

sts = boto3.client("sts")

assume_response = sts.assume_role(
    RoleArn=os.environ.get('ROLE_ARN'),
    RoleSessionName='cdn'
)

assumed_credentials = assume_response.get("Credentials")

# Use assumed credentials to create a new client
client_assumed = boto3.client("sts",
                              aws_access_key_id=assumed_credentials.get("AccessKeyId"),
                              aws_secret_access_key=assumed_credentials.get("SecretAccessKey"),
                              aws_session_token=assumed_credentials.get("SessionToken"))

# Do an allowed API call with the that client
pprint.pprint(client_assumed.get_caller_identity())
