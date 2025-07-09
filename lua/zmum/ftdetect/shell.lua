vim.filetype.add({
  pattern = {
    ['%.zshrc$'] = 'sh',
    ['%.bashrc$'] = 'sh',
    ['%.profile$'] = 'sh',
    ['%.bash_profile$'] = 'sh',
    ['%.bash_logout$'] = 'sh',
    ['%.zprofile$'] = 'sh',
    ['%.zshenv$'] = 'sh',
    ['%.zlogin$'] = 'sh',
    ['%.zlogout$'] = 'sh',
  },
})
