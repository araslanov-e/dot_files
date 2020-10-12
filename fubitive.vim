function! s:function(name) abort
  return function(substitute(a:name,'^s:',matchstr(expand('<sfile>'), '<SNR>\d\+_'),''))
endfunction

function! s:bitbucket_url(opts, ...) abort
  if a:0 || type(a:opts) != type({})
    return ''
  endif
  let path = substitute(a:opts.path, '^/', '', '')
  let domain_pattern = exists('g:fubitive_domain_pattern') ? g:fubitive_domain_pattern : 'bitbucket\.org'
  let domains = exists('g:fugitive_bitbucket_domains') ? g:fugitive_bitbucket_domains : []
  for domain in domains
    let domain_pattern .= '\|' . escape(split(domain, '://')[-1], '.')
  endfor

  if repo_path ==# ''
    return ''
  endif
  
  let domain = 'bitbucket.org'
  let root = 'https://' .domain . '/' . repo_path
  
  if path =~# '^\.git/refs/heads/'
    return root . '/commits/' . path[16:-1]
  elseif path =~# '^\.git/refs/tags/'
    return root . '/src/' .path[15:-1]
  elseif path =~# '.git/\%(config$\|hooks\>\)'
    return root . '/admin'
  elseif path =~# '^\.git\>'
    return root
  endif

  if a:opts.commit =~# '^\d\=$'
    let commit = a:opts.repo.rev_parse('HEAD')
  else
    let commit = a:opts.commit
  endif

  if get(a:opts, 'type', '') ==# 'tree' || a:opts.path =~# '/$'
    let url = s:sub(root . '/browse/' . path . '?at=' . commit,'/$','')
  elseif get(a:opts, 'type', '') ==# 'blob' || a:opts.path =~# '[^/]$'
    let url = root . '/src/' . commit . '/' .path
    if get(a:opts, 'line1')
      let url .= '#' . a:opts.line1
      if get(a:opts, 'line2')
        let url .= '-' . a:opts.line2
      endif
    endif
  else
    let url = root . '/commits/' . commit
  endif
  return url
endfunction

if !exists('g:fugitive_browse_handlers')
  let g:fugitive_browse_handlers = []
endif

call insert(g:fugitive_browse_handlers, s:function('s:bitbucket_url'))
