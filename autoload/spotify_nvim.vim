function! s:SpotifySearchBuffer(query, type)
    if buflisted('Spotify')
        bd Spotify
    endif
    below new Spotify
    call append(0, 'Spotify ' . a:type . ' Results For: ' . a:query)
    call append(line('$'), "Song                                           Artist                Album")
    call append(line('$'), "--------------------------------------------------
                           \------------------------------------------------")

python3 << endpython
import vim
from rplugin.python3.spotify_nvim.track import search_track
track_list = search_track()
for element in track_list:
    row = "{:<45}  {:<20}  {:<}".format(element["name"], element["artists"][0]["name"], element["album"]["name"])
    vim.command('call append(line("$"), \'{}\')'.format(row))
endpython
    resize 14
    normal! gg
    5
    setlocal nonumber
    setlocal nowrap
    setlocal buftype=nofile
    map <buffer> <Enter> <esc>:SpSelect<CR>
    map <buffer> <Space> <esc>:SpToggle<CR>

endfunction
