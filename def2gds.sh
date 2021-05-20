#!/bin/bash

### setting ###
FOUNDRY="sky130"
DESIGN_NAME="aes_cipher_top"

### running ###
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

for gds_file in $SHELL_FOLDER"/config/in_gds/"$FOUNDRY"/"*.gds
do
gds_files=$gds_files$gds_file","
done

for def_file in $SHELL_FOLDER"/source/"*.def
do
klayout -zz -rd design_name=$DESIGN_NAME \
-rd in_def=$def_file \
-rd in_gds=$gds_files \
-rd out_gds=$SHELL_FOLDER"/results/"$(basename $def_file .def)".gds" \
-rd tech_file=$SHELL_FOLDER"/config/tech_file/"$FOUNDRY"/"$FOUNDRY".lyt" \
-rm $SHELL_FOLDER"/config/util_file/def2gds.py"
done

echo "**********************************"
echo "******end******end******end*******"
echo "**********************************"







