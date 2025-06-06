{
  programs.tmux = {
    enable = true;
    extraConfig = ''
# list of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'egel/tmux-gruvbox'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'MunifTanjim/tmux-mode-indicator'

# Shortcut Settings
unbind r
bind r source-file ~/.tmux.conf

set -g prefix C-s
unbind C-b
bind Escape send-prefix

set -gq allow-passthrough on
set-window-option -g mode-keys vi

set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

set -s escape-time 0

bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

set -g mouse on

# Theme settings
set-option -g status-position top

set -g @tmux-gruvbox 'dark'
set -g @tmux-gruvbox-statusbar-alpha 'true'

set -g @tmux-gruvbox-left-status-a '#S' # tmux's session name

set -g @tmux-gruvbox-right-status-z '#h #{tmux_mode_indicator}'

# set -g @catppuccin_flavor "mocha"
# set -g @catppuccin_window_status_style "rounded"
 
# set -g @catppuccin_window_default_text " #W"
# set -g @catppuccin_window_current_text " #W"
# set -g @catppuccin_window_status ""
# set -g @catppuccin_window_current_background "#{@thm_mauve}"

# set -g status-left ""
# set -g status-right "#{E:@catppuccin_status_session}"
# set -ag status-right "#{E:@catppuccin_status_directory}"

# The plugins that need to ran
# run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
run '~/.tmux/plugins/tpm/tpm' # This must be at the end
    '';
  };
}
