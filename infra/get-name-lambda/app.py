import boto3
import json
import os

if os.getenv('LOCAL_DYNAMODB'):
    dynamodb = boto3.resource('dynamodb', endpoint_url='http://host.docker.internal:8000')
else:
    dynamodb = boto3.resource('dynamodb')
dynamodb = boto3.resource('dynamodb', endpoint_url='http://host.docker.internal:8000')
table = dynamodb.Table('Names')

def lambda_handler(event, context):
    response = table.scan()
    names = [item['name'] for item in response.get('Items', [])]

    return {
        'statusCode': 200,
        'body': json.dumps(names)
    }
