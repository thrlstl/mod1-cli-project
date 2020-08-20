require_relative '../config/environment'

system "clear"

$prompt = TTY::Prompt.new

graphic
login_signup
cli_menu

# binding.pry