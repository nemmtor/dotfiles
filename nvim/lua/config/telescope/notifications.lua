local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values

local M = {}

-- Create a Telescope picker for MiniNotify notifications
local show_notifications = function(opts)
  opts = opts or {}

  local notifications = require("mini.notify").get_all()
  local messages = {}

  for _, notification in ipairs(notifications) do
    print(notification.msg)
    local message = notification.msg or "No message"
    table.insert(messages, message)
  end

  pickers
    .new(opts, {
      prompt_title = "Notifications",
      finder = finders.new_table({
        results = messages,
        entry_maker = function(message)
          return {
            value = message,
            ordinal = message,
            display = message,
          }
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function() end)
        return true
      end,
      previewer = previewers.new_buffer_previewer({
        define_preview = function(self, entry, status)
          local notification = entry.value
          local content = entry.ordinal

          -- Set the content in the preview buffer
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { content })
        end,
      }),
    })
    :find()
end

M.setup = function()
  vim.keymap.set("n", "<space>sn", function()
    show_notifications()
  end, { desc = "[S]how [N]otifications" })
end

return M
