#!/usr/bin/env bash

# function convert{
#         convertmc
# }
# set -o xtrace


# basenames for 1-d plots
bplot="NB_Z_narrow_dose NB_Z_narrow_dose_water NB_Z_narrow_LET NB_Z_narrow_LET_water NB_Z_narrow_QEFF"
# basenames for images (2-d and 1-d)
bimg="NB_XY NB_XZ ${bplot}"
# basenames for text
btxt="NB_target_pos2_L NB_target_pos2_L_water NB_target_pos3_L NB_target_pos3_L_water"

td=`pwd`           # this directory where command was started from

for dir in input/plan*
do
    echo
    ed=$(ls -1 -d "${dir}"/run_* | tail -1)  # extract from latest run directory only
    od=${ed}/output   # output directory
    rdd=$(basename "${dir}")
    rd=results/${rdd}  # result directory

    mkdir -p "${rd}"

    echo "${od}"
    cd "${od}" || exit  # change into every plan*/run_*/output directory

    # generate PNG images and copy into results dir
    for b in $bimg
    do
        for file in ${b}*.bdo
        do
            if [ -e "${file}" ]; then
                echo  "  Convert ${file} to image files"
                convertmc image --many "${file}"
            fi
        done
    done
    cd "${td}" || exit
    cp -v "${od}"/NB*.png "${rd}"

    cd $od
    # generate plotdata (.dat) and copy into results dir
    for b in $bplot
    do
        for file in ${b}*.bdo
        do
            if [ -e "${file}" ]; then
                echo  "  Convert ${file} to plotdata files"
                convertmc plotdata --many "${file}"
            fi
        done
    done
    cd "${td}" || exit
    cp -v "${od}"/NB*.dat "${rd}"

    cd $od    # generate text results for VOIs (.txt) and copy into results dir
    for b in $btxt
    do
        for file in ${b}*.bdo
        do
            if [ -e "${file}" ]; then
                echo  "  Convert ${file} to text files"
                convertmc txt --many "${file}"
            fi
        done
    done
    cd "${td}" || exit
    cp -v "${od}"/NB*.txt "${rd}"

done
