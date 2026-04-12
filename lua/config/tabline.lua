function TabLineCell(i)
  local isSelected = vim.fn.tabpagenr() == i
  local buflist = vim.fn.tabpagebuflist(i)
  local winnr = vim.fn.tabpagewinnr(i)
  local bufnr = buflist[winnr]
  local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

  local name = vim.fn.bufname(bufnr)
  if name == '' then
    name = '[No Name]'
  end

  local modified = vim.fn.getbufvar(bufnr, '&modified') == 1 and '[+] ' or ''

  return hl .. '%' .. i .. 'T' .. ' ' .. name .. modified .. ' '
end

function TabLine()
  local line = ''
  for i = 1, vim.fn.tabpagenr('$'), 1 do
    line = line .. TabLineCell(i)
  end
  line = line .. '%#TabLineFill#%='
  return line
end

vim.opt.tabline = '%!v:lua.TabLine()'
