local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	print("Error: ", copilot)
	return
end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
