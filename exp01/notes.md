## kill workes 

ps -au | egrep worker | awk  -F ' '  '{print $2}' |xargs -I@ sudo kill -9 @ ;