#Write a while loop that takes input from the user, performs an action,
#and only stops when the user types "STOP". Each loop can get info from the user.
def get_user_action
  p "Enter an action:"
  gets.chomp.to_s
end

action = ""

while action != "stop"
  action = get_user_action()
end
