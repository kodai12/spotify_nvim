import requests
import json
import vim

def _get_access_token():
  auth_url = "https://accounts.spotify.com/api/token"
  headers = {
          'Authorization': 'Basic {}'.format(vim.eval("g:spotify_token")),
          'Content-Type': 'application/x-www-form-urlencoded'
          }
  payload = {'grant_type': 'client_credentials'}
  res = requests.post(auth_url, params=payload, headers=headers)
  return json.loads(res.text)['access_token']

def get_auth_header():
    access_token = _get_access_token()
    authorization_header = {"Authorization":"Bearer {}".format(access_token)}
    return authorization_header
