#!/bin/bash

MODULE_NAME=""
PLATFORMS=(iOS macOS tvOS)
SELECTED_PLATFORMS=()

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

foundation() {
    select_module_name
    select_platforms

    platforms=$( IFS=$','; echo "${SELECTED_PLATFORMS[*]}" )    

    echo ""
    echo "📦 Creating Foundation module ${MODULE_NAME} for platforms ${platforms}"

    tuist scaffold foundation --name ${MODULE_NAME} --platforms $platforms
}

feature() {
    echo ""
    echo "⛔️ Not implemented yet!"
    exit 1
}

app() {
    echo ""
    echo "⛔️ Not implemented yet!"
    exit 1
}

echo ""
echo "📦 Type of module?"
select ffa in "Foundation" "Feature" "App"; do
    case $ffa in
        Foundation ) foundation; break;;
        Feature ) feature; break;;
        App ) app; break;;
    esac
done
