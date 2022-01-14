if [  $1 == '0' ]
then
 exit 1

 elif [[  -d $1 || -f $1  ]]
 then
 echo "Monitoring $1"
        inotifywait -m -e create,delete,modify,move $1 | while read FILE
        do
                echo "A change has been detected in $1"
        
               
        sleep 10
        done
 else
        echo "File or directory $1 not found."
        exit 1
fi
