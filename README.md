# Shell_send_Email

script to send email automatically

 1-install smtp

 #yum update -y && yum install -y ssmtp


 2-set up the google security tab in your account
 and allow access to applications has ON

 "
 3- configure smtp

  #cat /etc/ssmtp/ssmtp.conf

  root=[your email]@gmail.com
  mailhub=smtp.gmail.com:587
  AuthUser=[your email]@gmail.com
  AuthPass=[password]
  UseSTARTTLS=yes
  Hostname=localhost.localdomain [put the real hostname]
  FromLineOverride=YES
  UseTLS=YES
  #IMPORTANT: The following line is mandatory for TLS authentication
  TLS_CA_File=/etc/pki/tls/certs/ca-bundle.crt

  #cat /etc/ssmtp/revaliases

   root:[youremail]@gmail.com:smtp.gmail.com:587


4- 1 there are two methods either write the email after the execution of the script
 or 2- write the email in a file and then run the script
 
  1-write the email in a file and send it to a script

  inside the script
    ssmtp [email]
  
  2-write the email
  
  To: [email]
  From: [email]
  Cc: [email]
  Subject: TEST
  This is the Body
