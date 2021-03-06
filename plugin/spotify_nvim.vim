" --------------------------------
" Add plugins
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:p:h")'))
python import rplugin.python3.spotify_nvim.track as spotify_nvim

" --------------------------------
"  Define functions
" --------------------------------
function! spotify_nvim#search_track(query)
  python spotify_nvim.search_track(vim.eval('a:query'))
endfunction


command! -nargs=1  SpotifySearch call spotify_nvim#search_track(<f-args>)
