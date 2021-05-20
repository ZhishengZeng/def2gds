#!/bin/bash

###############
### SETTING ###
###############

FOUNDRY="sky130"
DESIGN_NAME="aes_cipher_top"

#####################
### DIR STRUCTURE ###
#####################

ROOT_DIR=$(cd "$(dirname "$0")";pwd)
DEF_DIR=$ROOT_DIR"/source/"
RESULT_DIR=$ROOT_DIR"/result/"
GDSLIB_DIR=$ROOT_DIR"/config/in_gds/"$FOUNDRY"/"
TECH_DIR=$ROOT_DIR"/config/tech_file/"$FOUNDRY"/"
UTIL_DIR=$ROOT_DIR"/config/util_file/"

###############
### RUNNING ###
###############

if [ ! -d $RESULT_DIR ];then
  mkdir $RESULT_DIR
fi  

for temp in $GDSLIB_DIR*.gds
do
GDS_FILES=$GDS_FILES$temp","
done

for DEF_FILE in $DEF_DIR*.def
do
klayout \
-zz \
-rd design_name=$DESIGN_NAME \
-rd in_def=$DEF_FILE \
-rd in_gds=$GDS_FILES \
-rd out_gds=$RESULT_DIR$(basename $DEF_FILE .def)".gds" \
-rd tech_file=$TECH_DIR$FOUNDRY".lyt" \
-rm $UTIL_DIR"def2gds.py"
done

echo "**********************************"
echo "******end******end******end*******"
echo "**********************************"







