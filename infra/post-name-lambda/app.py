import os

import boto3
import json

if os.getenv('LOCAL_DYNAMODB'):
    dynamodb = boto3.resource('dynamodb', endpoint_url='http://host.docker.internal:8000')
else:
    dynamodb = boto3.resource('dynamodb')

table = dynamodb.Table('Names')

def lambda_handler(event, context):
    name = event['body']
    db_item = {'id': str(hash(name)), 'name': name}
    table.put_item(Item=db_item)

    return {
        'statusCode': 200,
        'body': json.dumps('Name inserted successfully')
    }