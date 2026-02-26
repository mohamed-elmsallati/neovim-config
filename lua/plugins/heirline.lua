return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- add new user interface icon
      icons = {
        VimIcon = "",
        Clock = "",
        Battery = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = "",
      },
      -- modify variables used by heirline but not defined in the setup call directly
      status = {
        -- define the separators between each section
        -- separators = {
        --   left = { "", "" }, -- separator for the left side of the statusline
        --   right = { " ", "" }, -- separator for the right side of the statusline
        --   tab = { "", "" },
        -- },
        -- add new colors that can be used by heirline
        colors = function(hl)
          local get_hlgroup = require("astroui").get_hlgroup
          -- Use a safe fallback if Folded isn't defined by your theme yet
          local folded_fg = get_hlgroup("Folded").fg or "#3b4261" 
          local comment_fg = get_hlgroup("Comment").fg or "#565f89"

          hl.git_branch_fg = comment_fg
          hl.blank_bg = folded_fg -- This is the key that was causing the error
          -- hl.file_info_bg 
          hl.nav_icon_bg = get_hlgroup("String").fg or "#9ece6a"
          hl.nav_fg = hl.nav_icon_bg
          hl.folder_icon_bg = get_hlgroup("Error").fg or "#f7768e"

          return hl
        end,
        attributes = {
          mode = { bold = true },
        },
        icon_highlights = {
          file_icon = {
            statusline = false,
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astroui.status")
      opts.tabline = nil
      opts.winbar = nil
      -- opts.statuscolumn = nil

      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astroui.status module

        -- add the vim mode component
        status.component.mode({
          -- enable mode text with padding as well as an icon before it
          mode_text = {
            icon = { kind = "VimIcon", padding = { right = 2, left = 2 } },
          },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = function()
              -- This pulls the dynamic color we just defined
              local color = require("astroui").get_hlgroup("CursorLineNr").fg
              return { main = color, right = color }
            end,
          },
        }),

        status.component.file_info({ 
          hl = { bg = "bg" }, -- Forces it to use the main statusline background
          surround = { separator = "none" }
        }),

        status.component.git_branch({
          git_branch = { padding = { left = 1 } },
          surround = { separator = "none" },
        }),

        status.component.git_diff({
          padding = { left = 1 },
          surround = { separator = "none" },
        }),

        status.component.fill(),

        status.component.lsp({
          lsp_client_names = false,
          surround = { separator = "none", color = "bg" },
        }),

        status.component.fill(),
        status.component.diagnostics({ surround = { separator = "right" } }),
        status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),

        -- WARN: Clock Component
        status.component.builder({
          {
            provider = function()
              local time = os.date("%H:%M")
              return status.utils.stylize(time, {
                icon = { kind = "Clock", padding = { right = 2 } },
                padding = { right = 1, left = 1 },
              })
            end,
          },
          update = {
            "User",
            "ModeChanged",
            callback = vim.schedule_wrap(function(_, args)
              if (args.event == "User" and args.match == "UpdateTime")
                or (args.event == "ModeChanged" and args.match:match(".*:.*"))
              then
                vim.cmd.redrawstatus()
              end
            end),
          },
          hl = status.hl.get_attributes("mode"),
          surround = { 
            separator = "none", 
            color = function()
              local color = require("astroui").get_hlgroup("CursorLineNr").fg
              return { main = color, right = color }
            end 
          },
        }),
      }

      -- Timer MUST be defined outside the statusline table
      local timer = vim.uv.new_timer()
      timer:start(
        (60 - tonumber(os.date("%S"))) * 1000,
        60000,
        vim.schedule_wrap(function()
          vim.api.nvim_exec_autocmds("User", { pattern = "UpdateTime", modeline = false })
        end)
      )
      local bat_timer = vim.uv.new_timer()
      bat_timer:start(0, 30000, vim.schedule_wrap(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "UpdateBattery", modeline = false })
      end))
    end,
  },
}
