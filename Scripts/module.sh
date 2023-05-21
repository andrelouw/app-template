#!/bin/bash

MODULE_NAME=""
MODULE_TYPES=(Foundation Feature)
PLATFORMS=(iOS macOS tvOS)
SELECTED_PLATFORMS=()
SELECTED_MODULE_TYPE=""

select_module_type() {
    echo ""
    echo "📦 Type of module?"
    select type in "${MODULE_TYPES[@]}" ; do
        SELECTED_MODULE_TYPE=$type
        break
    done
}

select_module_name() {
    echo ""
    read -p "📦 The module's name?: " MODULE_NAME
}

select_platforms() {
    echo ""
    echo "📦 Platforms:"
    PS3='You can select multiple space separated options:  '
    select platform in "${PLATFORMS[@]}" ; do
        for reply in $REPLY ; do
            SELECTED_PLATFORMS+=(${PLATFORMS[reply - 1]})
        done
        [[ $SELECTED_PLATFORMS ]] && break
    done   
}

create_module() {
    # Create array of platforms, separated by a `,`
    platforms=$( IFS=$','; echo "${SELECTED_PLATFORMS[*]}" )    
    # Create the module command name by lower casing the selected module
    module_command=`echo "$SELECTED_MODULE_TYPE" | awk '{print tolower($0)}'`

    echo ""
    echo "📦 Creating ${SELECTED_MODULE_TYPE} module ${MODULE_NAME} for platforms ${platforms} ..."

    tuist scaffold $module_command --name $MODULE_NAME --platforms $platforms
}

generate_and_open() {
    echo ""
    echo "📦 Generating and opening the module..."

    module_path=""

    if [ "$SELECTED_MODULE_TYPE" = "Feature" ]; then
        module_path="Features"
    else
        module_path=$SELECTED_MODULE_TYPE
    fi


    tuist generate -p Modules/$module_path/$MODULE_NAME
}

echo "📦 Follow the instructions to create a new module"
select_module_type
select_module_name
select_platforms
create_module
generate_and_open
