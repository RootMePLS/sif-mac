{ username, ... }:
let
  folder = "/Users/${username}/";
in
{
  home.file.aerospace-laptop = {
    executable = false;
    target = "${folder}/.aerospace.toml";
    text = ''
        # Reference: https://github.com/i3/i3/blob/next/etc/config
        # https://nikitabobko.github.io/AeroSpace/goodness.html

        # defaults write -g NSWindowShouldDragOnGesture YES
        # defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

        # https://github.com/sbmpost/AutoRaise.git
        # https://github.com/FelixKratz/JankyBorders
        # https://github.com/FelixKratz/SketchyBar

        enable-normalization-flatten-containers = false
        enable-normalization-opposite-orientation-for-nested-containers = false

        start-at-login = true

        after-login-command = []
        #after-startup-command = [
        #    # 'exec-and-forget /opt/homebrew/opt/sketchybar/bin/sketchybar',
        #    'exec-and-forget /opt/homebrew/opt/borders/bin/borders active_color=0xaa00a56c inactive_color=0x00333333 width=6',
        #    'exec-and-forget autoraise',
        #]

        default-root-container-layout = 'tiles'

        after-startup-command = [
            'workspace 1', 'layout h_accordion',
            'workspace 2', 'layout h_accordion',
            'workspace 3', 'layout h_accordion',
            'workspace 4', 'layout h_accordion',
            'workspace 5', 'layout h_accordion',
            'workspace 6', 'layout h_accordion',
            'workspace 7', 'layout h_accordion',
            'workspace 8', 'layout h_accordion',
            'workspace 9', 'layout h_accordion',
        ]

        # Notify Sketchybar about workspace change
        #exec-on-workspace-change = ['/bin/bash', '-c',
        #    '/opt/homebrew/opt/sketchybar/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE'
        #]

        accordion-padding     = 0

        gaps.inner.horizontal = 6
        gaps.inner.vertical   = 6
        gaps.outer.left       = 2
        gaps.outer.bottom     = 2
        gaps.outer.top        = 2
        gaps.outer.right      = 2


        # does not support dvorak
        [mode.main.binding]
        alt-enter     = 'exec-and-forget open -n -a warp'

        cmd-q         = 'close'
        cmd-shift-c   = 'reload-config'

        cmd-o         = 'mode resize'

        cmd-left         = 'focus left'
        cmd-right        = 'focus right'
        cmd-z         = 'focus down'
        cmd-p         = 'focus up'

        cmd-j         = 'split horizontal'
        cmd-period    = 'split vertical'

        cmd-y         = 'fullscreen'

        cmd-k = 'layout v_accordion'               # 'layout stacking' in i3
        cmd-l = 'layout h_accordion'               # 'layout tabbed' in i3#cmd-d = 'layout tiles horizontal vertical' # 'layout toggle split' in i3

        cmd-space     = 'layout floating tiling'           # 'floating toggle' in i3

        # Not supported, because this command is redundant in AeroSpace mental model.
        # See: https://nikitabobko.github.io/AeroSpace/guide.html#floating-windows
        # cmd-space = 'focus toggle_tiling_floating'

        # `focus parent`/`focus child` are not yet supported, and it's not clear whether they
        # should be supported at all https://github.com/nikitabobko/AeroSpace/issues/5
        # cmd-a = 'focus parent'

        cmd-1       = 'workspace 1'
        cmd-2       = 'workspace 2'
        cmd-3       = 'workspace 3'
        cmd-4       = 'workspace 4'
        cmd-5       = 'workspace 5'
        cmd-6       = 'workspace 6'
        cmd-7       = 'workspace 7'
        cmd-8       = 'workspace 8'
        cmd-9       = 'workspace 9'
        cmd-0       = 'workspace 10'

        cmd-shift-1 = 'move-node-to-workspace 1'
        cmd-shift-2 = 'move-node-to-workspace 2'
        cmd-shift-3 = 'move-node-to-workspace 3'
        cmd-shift-4 = 'move-node-to-workspace 4'
        cmd-shift-5 = 'move-node-to-workspace 5'
        cmd-shift-6 = 'move-node-to-workspace 6'
        cmd-shift-7 = 'move-node-to-workspace 7'
        cmd-shift-8 = 'move-node-to-workspace 8'
        cmd-shift-9 = 'move-node-to-workspace 9'
        cmd-shift-0 = 'move-node-to-workspace 10'


        [mode.resize.binding]
        j      = 'resize width -50'
        x      = 'resize height -50'
        c      = 'resize height +50'
        p      = 'resize width +50'
        enter  = 'mode main'
        esc    = 'mode main'


        [workspace-to-monitor-force-assignment]
        1  = [1, 'built-in']
        2  = [1, 'built-in']
        3  = [1, 'built-in']
        4  = [1, 'built-in']
        5  = [1, 'built-in']
        6  = [1, 'built-in']
        7  = [1, 'built-in']
        8  = [1, 'built-in']
        9  = [1, 'built-in']
        10 = [1, 'built-in']

        # 1  = [1, 'built-in']
        # 2  = [1, 'built-in']
        # 3  = [1, 'built-in']
        # 4  = [1, 'built-in']
        # 5  = [1, 'built-in']
        # 6  = [2, 'built-in']
        # 7  = [2, 'built-in']
        # 8  = [2, 'built-in']
        # 9  = [2, 'built-in']
        # 10 = [2, 'built-in']


        ## General
        [[on-window-detected]]
        if.app-name-regex-substring = "^Activity Monitor$"
        run = 'layout floating'

        [[on-window-detected]]
        if.app-name-regex-substring = "^Finder$"
        run = 'layout floating'

        [[on-window-detected]]
        if.app-name-regex-substring = "^Preview$"
        run = 'layout floating'

        [[on-window-detected]]
        if.app-name-regex-substring = "^System Information$"
        run = 'layout floating'

        [[on-window-detected]]
        if.app-name-regex-substring = "^System Settings$"
        run = 'layout floating'

        [[on-window-detected]]
        #if.app-name-regex-substring = "^System Preferences$"
        if.app-id = 'com.apple.systempreferences'
        run = 'layout floating'

        [[on-window-detected]]
        if.app-id = 'com.webcatalog.switchbar'
        run = 'layout floating'

        [[on-window-detected]]
        if.app-id = 'org.flameshot'
        run = 'layout floating'

        [[on-window-detected]]
        if.app-id = 'com.apple.findmy'
        run = 'layout floating'

        [[on-window-detected]]
        if.app-id = 'com.1password.1password'
        run = 'layout floating'

        ## workspace 1
        [[on-window-detected]]
        if.app-id = 'org.alacritty'
        check-further-callbacks = true
        run = 'move-node-to-workspace 1'

        # [[on-window-detected]]
        # if.app-id = 'com.1password.1password'
        # check-further-callbacks = true
        # run = 'move-node-to-workspace 1'

        ## workspace 2
        [[on-window-detected]]
        if.app-id = 'com.brave.Browser'
        check-further-callbacks = true
        run = 'move-node-to-workspace 2'

        ## workspace 3
        [[on-window-detected]]
        if.app-id = 'com.microsoft.VSCode'
        check-further-callbacks = true
        run = ['move-node-to-workspace 3']

        ## workspace 4
        [[on-window-detected]]
        if.app-id = 'com.tinyspeck.slackmacgap'
        check-further-callbacks = true
        run = 'move-node-to-workspace 4'

        [[on-window-detected]]
        if.app-id = 'ru.keepcoder.Telegram'
        check-further-callbacks = true
        run = 'move-node-to-workspace 4'

        [[on-window-detected]]
        if.app-name-regex-substring = "^Microsoft Teams"
        run = 'move-node-to-workspace 4'

        [[on-window-detected]]
        if.app-id = 'com.skype.skype'
        check-further-callbacks = true
        run = 'move-node-to-workspace 4'

        [[on-window-detected]]
        if.app-id = 'us.zoom.xos'
        check-further-callbacks = true
        run = 'move-node-to-workspace 4'

        [[on-window-detected]]
        if.app-id = 'com.google.Chrome.app.kjgfgldnnfoeklkmfkjfagphfepbbdan'
        check-further-callbacks = true
        run = 'move-node-to-workspace 4'

        ## workspace 5
        [[on-window-detected]]
        if.app-id = 'com.spotify.client'
        check-further-callbacks = true
        run = 'move-node-to-workspace 5'

        ## workspace 6
        [[on-window-detected]]
        if.app-id = 'com.google.Chrome'
        check-further-callbacks = true
        run = ['move-node-to-workspace 6']

        ## workspace 7
        [[on-window-detected]]
        if.app-id = 'com.apple.iCal'
        check-further-callbacks = true
        run = ['move-node-to-workspace 7']

        [[on-window-detected]]
        if.app-id = 'com.apple.mail'
        check-further-callbacks = true
        run = ['move-node-to-workspace 7']

        ## workspace 8
        [[on-window-detected]]
        if.app-id = 'com.openai.chat'
        check-further-callbacks = true
        run = ['move-node-to-workspace 8']

        [[on-window-detected]]
        if.app-id = 'md.obsidian'
        check-further-callbacks = true
        run = ['move-node-to-workspace 8']

        ## workspace 9

    '';
  };
}
