#!/bin/bash
diffed_def_dir="./soc_asic_top-success/"

for def_file in $diffed_def_dir*.def
do

no1def_file=$no2def_file
no2def_file=$def_file

echo "*********"
echo $no1def_file"  diff  "$no2def_file
touch "./diff_logs/"$(basename $no1def_file .def)"__diff__"$(basename $no2def_file .def)".log"
diff -u $no1def_file $no2def_file > "./diff_logs/"$(basename $no1def_file .def)"__diff__"$(basename $no2def_file .def)".log"
echo "*********"

done





