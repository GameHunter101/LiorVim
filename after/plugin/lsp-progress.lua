local status, progress = pcall(require, "lsp-progress")
if not status then
	return
end

progress.setup()
