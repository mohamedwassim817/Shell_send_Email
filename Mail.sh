#! /bin/bash

#check if ssmtp is installed or not 

function check(){

cd /etc/ssmtp

if [ -f ssmtp.conf ]
then 
  echo "************ssmtp installed***************"
else 
  echo "============ssmtp not installed==========="
  yum update -y && yum install -y ssmtp
fi
} 

check

function configSsmtp(){

echo "************Ssmtp configuration*************"
read -p "enter your e-mail :" root
read -p "enter your mail provider Gmail/Yahoo :" mailhub
read -p "enter your mail username = e-mail :" AuthUser
echo "enter your mail password :" 
read -s AuthPass
#
# write configuration in /etc/ssmtp/ssmtp.conf
#
echo "root=$root" > /etc/ssmtp/ssmtp.conf
echo "mailhub=smtp.$mailhub.com:587" >> /etc/ssmtp/ssmtp.conf
echo "AuthUser=$AuthUser" >> /etc/ssmtp/ssmtp.conf
echo "AuthPass=$AuthPass" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=yes" >> /etc/ssmtp/ssmtp.conf
echo "Hostname=${HOSTNAME}" >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
echo "UseTLS=YES" >> /etc/ssmtp/ssmtp.conf
echo "TLS_CA_File=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/ssmtp/ssmtp.conf
#
# write configuration in /etc/ssmtp/revaliases
#
echo "***********writing configuration into revaliases*************"

echo "root:$AuthUser:smtp.$mailhub.com:587" >> /etc/ssmtp/revaliases


}

configSsmtp

function writeMail(){

echo "============== ecriture du mail ======================="

if [ -e fichier.txt ]
then
 echo "*********fichier existe**********"
else
 echo "*********fichier n'existe pas **********"
 touch fichier.txt
 break
fi



read -p "enter your e-mail destinataire: " To
read -p "enter your subject exp TEST1: " subject
read -p "enter your mail body exp body body: " Body





echo "To:$To" > fichier.txt
echo "From:$AuthUser" >> fichier.txt
echo "Subject:$subject" >> fichier.txt
echo $Body >> fichier.txt
 
#ssmtp $AuthUser $To $AuthUser $subject $Body
ssmtp $AuthUser < fichier.txt

echo "Your mail is sucessfully send !!"

: ' To: $AuthUser
 From: $AuthUser
 Cc: $AuthUser
 Subject: $subject
 $Body 

 EXEC <&-





'

}

writeMail



