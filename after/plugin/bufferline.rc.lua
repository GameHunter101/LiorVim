local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
    options = {
        mode = "buffers",
        separator_style="slope",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp"
    },
}
