#!/bin/bash

#keepGoing="y"
#while [ $keepGoing == "y" ]
#do
    answer="n"
    while [ $answer == "n" ]
    do
        echo "------------------------------------------"
        echo "Please enter the name of the component: "
        echo "------------------------------------------"
        read componentName

        echo "------------------------------------------"
        echo "You entered $componentName. Is that correct? [y/n]"
        echo "------------------------------------------"
        read answer 
    done

    lowercased="${componentName,,}"
    directory=$(pwd)
    directoryPathLen=${#directory}-5
    workingDirectory=${directory:0:$directoryPathLen}
    modelWorkingDirectory="$workingDirectory""src/models/"
    workingDirectory+="src/components/"

    ###########################################################
    # CREATE TEMPLATES
    ##########################################################
    # component template
    component="$(cat ./reactComponentTemplate.txt)"
    templatedComponent=${component//REACT_COMPONENT_LOWERCASE/$lowercased}
    templatedComponent=${templatedComponent//REACT_COMPONENT/$componentName}

    # scss template
    scss="$(cat ./reactComponentSCSSTemplate.txt)"
    templatedSCSS=${scss//REACT_COMPONENT_LOWERCASE/$lowercased}

    # model template 
    model="$(cat ./modelTemplate.txt)"
    templatedModel=${model//MODEL_NAME/"$componentName""Model"}

    # inline styles 
    inlineStyles="$(cat ./inlineStyles.txt)"

    # helper functions
    helperFunctions="$(cat ./helperFunctions.txt)"

    ############################################################
    # CREATE MAIN COMPONENT FILES 
    ############################################################
    set -o noclobber
    componentDirectory="$workingDirectory""$componentName"
    if [ ! -d "$componentDirectory" ]
    then mkdir "$componentDirectory"
    fi

    componentFileName="$componentName.js"
    scssFileName="$componentName.scss"

    tempFileName="$componentDirectory""/$componentFileName" 
    tempFileName2="$componentDirectory""/$scssFileName"
    tempFileName3="$componentDirectory""/inlineStyles.js"
    tempFileName4="$componentDirectory""/helperFunctions.js"
    echo "----------------------------------------------------"
    echo "Creating files: "
    echo "1) $tempFileName"
    echo "2) $tempFileName2"
    echo "3) $tempFileName3"
    echo "4) $tempFileName4"
    echo "Is this okay? [y/n]"
    echo "----------------------------------------------------"
    read doCreateFiles
    if [ $doCreateFiles == "y" ]
    then 
        echo "Going to create files"
        echo "1) $tempFileName"
        echo "2) $tempFileName2"
        echo "3) $tempFileName3"
        echo "4) $tempFileName4"
        echo "$templatedComponent" > "$tempFileName"
        echo "$templatedSCSS" > "$tempFileName2"
        echo "$inlineStyles" > "$tempFileName3"
        echo "$helperFunctions" > "$tempFileName4"
    fi 

    echo "------------------------------------------"
    echo "Would you like to create a model? [y/n]"
    echo "------------------------------------------"
    read createModel

    if [ $createModel == "y" ]
    then 
        actualModelWorkingDirectory="$modelWorkingDirectory"$componentName 
        modelFileName="$actualModelWorkingDirectory""/$componentName""Model.js"

        if [ ! -d "$actualModelWorkingDirectory" ]
        then mkdir "$actualModelWorkingDirectory"
        fi
        
        echo "------------------------------------------------"
        echo "Creating the following files: "
        echo "$modelFileName"
        echo "Is that okay? [y/n]"
        echo "-------------------------------------------------"
        read yesCreateModel

        if [ $yesCreateModel == "y" ]
        then 
            echo "Going to create file $modelFileName..."
            echo "$templatedModel" > "$modelFileName"
        fi
    fi


#   echo "------------------------------------------"
#   echo "Created component files. What would you like to keep files? [y/n]"
#   echo "------------------------------------------"
#   read answer 

#    if [ $answer == "n" ]
#    then 
#       echo "------------------------------------------"
#       echo "Removing the following directories:"
#       echo "$componentDirectory"
#       echo "$actualModelWorkingDirectory"
#       echo "Is this okay? [y/n]"
#       echo "------------------------------------------"
#       read goodToDelete

#       if [ $goodToDelete == "y" ]
#       then 
#            rm -rf "$componentDirectory"
#            rm -rf "$actualModelWorkingDirectory"
#        fi    
#    fi

#    cd "$directory"
#    pwd 

#    echo "------------------------------------------"
#    echo "Would you like to create another component? [y/n]"
#    echo "------------------------------------------"
#    read keepGoing 

#    unset componentName
#    unset lowercased
#    unset templatedComponent
#    unset templatedSCSS
#    unset templatedModel
#    unset componentDirectory
