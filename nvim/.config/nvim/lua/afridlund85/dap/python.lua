local dap_status_ok, dap_python = pcall(require, "dap-python")
if not dap_status_ok then
  return
end

dap_python.setup('~/.virtualenvs/debugpy/bin/python')

