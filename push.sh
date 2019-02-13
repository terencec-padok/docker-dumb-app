#!/bin/bash

#Load data.sh :
source data.sh

echo "----------------Initialing deployment script----------------"

#Checking if you have everything up to branch (nothing to push or in conflict)
if git diff-index --quiet HEAD --; then
    #Your repo is up to date and there is nothing to push, you can safely
    #checkout to other branches (which mean push any branches)
    echo "Here are your branches, choose which one you want to deploy :"

    #Delete first lines then saves (Current branch and HEAD position) and 
    #Removing the white space before first word with sed on each lines
    git branch -r | sed -e 's/^[ \t]*//' >> branch.txt
    vim branch.txt -c ":g/HEAD/d" -c ":wq!"

    echo "------------------------------------------------------------"
    #Array that will contain each branch in this git repo
    BRANCH=() 

    # Read each lines of the text file and add it as option in our array
    while IFS='' read -r line || [[ -n "$line" ]]; do
        BRANCH+=("$line")
    done < "branch.txt"
    rm branch.txt

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

    #Edit the output to get only the branch_name (instead of origin/branch_name)
    S=`echo $VALUE | awk -F '/' '{print $2}'`
    #echo $S 

    #Checkout on the selected branch
    git checkout $S

    #Now install 
    ssh -i $KEYNAME $SERVER

    scp -i $KEYNAME $SERVER:/app



else
    #There is Changements
    echo "Error, you need to add, commit and push your changes before executing this script..."
    echo "Exiting now..."
fi









