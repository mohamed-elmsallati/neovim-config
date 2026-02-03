-- In your AstroNvim configuration (user/init.lua or polish.lua)
return {
  -- ... other configs
  highlights = {
    -- This table overrides highlights in ALL themes
    init = {
      -- Kill the sidebar backgrounds
      SignColumn = { bg = "NONE" },
      FoldColumn = { bg = "NONE" },
      CursorLineNr = { bg = "NONE" },
      LineNr = { bg = "NONE" },
      WinSeparator = { bg = "NONE" },


      -- Barbar Groups
      BufferTabpageFill = { bg = "NONE" },
      BufferVisible = { bg = "NONE" },
      BufferInactive = { bg = "NONE" },
    },
    -- Specifically for tokyonight if you use it
    tokyonight = {
      SideBar = { bg = "NONE" },
      SideBarNC = { bg = "NONE" },
    }
  },
}
-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
