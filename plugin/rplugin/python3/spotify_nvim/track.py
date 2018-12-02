import vim
import requests
import json
from rplugin.python3.spotify_nvim.auth import get_auth_header

def search_track(query: str):
    search_query = query.replace(' ', '+')
    url = "https://api.spotify.com/v1/search?q={}&type=track".format(search_query)
    res = requests.get(url, headers=get_auth_header())
    items = json.loads(res.text)["tracks"]["items"]
    if len(items) is not 0:
        item_list = []
        for item in items:
            item_list.append(item)
            vim.command('call s:SpotifySearchBuffer("query-test", "Search")')
        return item_list

    else:
        #  vim.command('echo "No track found."')
        pass
