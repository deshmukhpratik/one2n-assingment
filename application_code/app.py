from flask import Flask, jsonify
import boto3

# Initialize Flask app
app = Flask(__name__)

# Initialize S3 client
s3 = boto3.client('s3')

# Your S3 Bucket Name
BUCKET_NAME = 'one2n-app-bucket'  # Replace with your actual S3 bucket name

def list_s3_objects(prefix=None):
    """
    List objects in the S3 bucket under a specific prefix.
    """
    try:
        # If prefix is provided, list objects under that prefix (directory)
        if prefix:
            response = s3.list_objects_v2(Bucket=BUCKET_NAME, Prefix=prefix, Delimiter='/')
        else:
            # List top-level objects in the bucket (directories)
            response = s3.list_objects_v2(Bucket=BUCKET_NAME, Delimiter='/')

        # If there are common prefixes (directories), return them
        if 'CommonPrefixes' in response:
            return [prefix['Prefix'].split('/')[-2] for prefix in response['CommonPrefixes']]
        
        # If there are files under the given prefix, return the file names
        if 'Contents' in response:
            return [file['Key'].split('/')[-1] for file in response['Contents']]
        
        return []  # Return empty list if no objects or directories are found
    except Exception as e:
        return {"error": str(e)}

@app.route('/list-bucket-content', methods=['GET'])
def list_top_level_content():
    """
    Lists the top-level content (directories) of the S3 bucket.
    """
    content = list_s3_objects()  # Get top-level content
    return jsonify({"content": content})

@app.route('/list-bucket-content/<path:dir>', methods=['GET'])
def list_dir_content(dir):
    """
    Lists the content (files) of a specific directory in the S3 bucket.
    If the directory is empty, return an empty list.
    """
    # Ensure we append a trailing slash to the directory to treat it as a directory
    if not dir.endswith('/'):
        dir += '/'
    
    content = list_s3_objects(prefix=dir)  # Get content under the specified directory
    return jsonify({"content": content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
