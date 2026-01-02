import os
import time
import jwt
import requests

APP_ID = os.getenv("APP_ID")
PRIVATE_KEY = os.getenv("PRIVATE_KEY")

def get_token():
    # Format key and create JWT for Python 3.14+
    formatted_key = PRIVATE_KEY.replace('\\n', '\n')
    payload = {
        "iat": int(time.time()) - 60,
        "exp": int(time.time()) + (10 * 60),
        "iss": APP_ID,
    }
    encoded_jwt = jwt.encode(payload, formatted_key, algorithm="RS256")
    
    # Replace with your actual Installation ID
    INSTALL_ID = os.getenv("INSTALLATION_ID") 
    
    url = f"https://api.github.com/app/installations/{INSTALL_ID}/access_tokens"
    headers = {"Authorization": f"Bearer {encoded_jwt}", "Accept": "application/vnd.github.v3+json"}
    
    r = requests.post(url, headers=headers)
    return r.json().get("token")

if __name__ == "__main__":
    token = get_token()
    print(f"Token generated for ShelfCompatibleMakerBot: {token[:4]}***")
