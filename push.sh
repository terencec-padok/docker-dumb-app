#!/bin/bash

echo "----------------Initialing deployment script----------------"
echo "Here are your branches, choose which one you want to deploy :"

#Delete first lines then saves (Current branch and HEAD position) and 
#Removing the white space before first word with sed on each lines
git branch -a | sed -e 's/^[ \t]*//' >> branch.txt
vim branch.txt -c ":1d" -c ":1d" -c ":wq!"

echo "------------------------------------------------------------"
#Array that will contain each branch in this git repo
BRANCH=() 

# Read each lines of the text file and add it as option in our array
while IFS='' read -r line || [[ -n "$line" ]]; do
    BRANCH+=("$line")
done < "branch.txt"


#Select which branch we want :
PS3="Enter the number next to the branch you want to deploy :"
select opt in "${BRANCH[@]}"; do
    case $opt in
        #Every reply that is not in the available choices.
        "")
            echo "------------------------------------------------------------"                        
            echo "Error '$REPLY' doesn't exist. Exiting now..."
            break
            ;;
        *)
            echo "------------------------------------------------------------"                        
            echo "You picked $opt ($REPLY)"
            VALUE="$opt"
            break
            ;;
    esac
done
S=`echo $VALUE | awk -F '/' '{print $3}'`
echo $S

rm branch.txt