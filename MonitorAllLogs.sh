cd /

read -p "enter the directory or file you want to monitor" v

cd ~
cd Bureau/MailLog
bash ./MonitorLog.sh $v  
