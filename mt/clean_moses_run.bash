#! /bin/bash



for rdir in $*
do
    echo "RUN DIR: #$rdir#"
    pushd $rdir > /dev/null
    tdirs=( `find . -iname "tune*"` )

    # clean alignments
    rm -fR giza*

    # clean corpus
    pushd corpus > /dev/null
    find . ! -iname "*stats" -exec rm -f {} \;
    popd > /dev/null

    # clean model
    pushd model > /dev/null
    rm -f extract*
    popd > /dev/null

    # clean tune-dirs
    for tdir in ${tdirs[*]}
    do
        echo "#TUN DIR: #$tdir#"
        pushd $tdir > /dev/null
        rm -f run*.dat run*.err run*.out run*.out.gz run*.opt run*.dense run*weights.txt run*.moses.ini extract* init.opt mert.out weights.txt filterphrases.*
        find . -iname "filtered" -exec rm -fR {} \;
        popd > /dev/null
    done

    popd > /dev/null

done


