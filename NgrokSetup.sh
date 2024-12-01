#Cài Ngrok
wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
#Giải nén
tar -xf ngrok.tgz 
#Tạo TCP
./ngrok config add-authtoken 2p3e4fzaidMPxiUOOEFv12nLrFT_7S7HxQQiGZmcSSVJWsphn
#Ngrok TcP
./ngrok tcp 5900 
