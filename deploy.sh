#!/bin/bash
#echo "Destination IP"
read -r -p "Enter Destination IP : " dest_ip
export DEST_IP=$(echo "$dest_ip")
#echo "Enter Username"
read -r -p "Enetr Username : " username
export USERNAME=$(echo "$username")
#echo "Enter Password"
read -r -s -p "Enter Password : " pswd
export SSHPASS=$(echo "$pswd")
echo ""
#echo "$DEST_IP"
#echo "$USERNAME"
#echo "$SSHPASS"
#echo "Please Confirm Y or N : "
read -r -p "Please Confirm to run the script Y or N : " confirm
echo ""
#service rsyslog restart

#if [ "echo $?" = "0" ]; then
		
	#echo "$confirm"
	if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        	echo "Got confirmation! Script is running now......"
        	sshpass -e scp -o StrictHostKeyChecking=no /work/test.py $USERNAME@$DEST_IP:/home/$USERNAME
		logger File has been copied to $DEST_IP:/home/$USERNAME directory
        	echo "Your task has been completed. Your file has been copied to $DEST_IP:/home/$USERNAME directory"
	else
        	logger $DEST_IP:$USERNAME had denied the operation
		echo "Sorry! Exiting now..."
	fi
#else
#	echo "Syslog client not working properly"
#fi

