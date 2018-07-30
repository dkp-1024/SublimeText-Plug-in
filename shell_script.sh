# -i.bak - create a backup, before executing the coammand, named by appending .bak
# remove all multiline comments
# sed -i.bak1  -r ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' $1

# remove backup file, if already exists, and create new backup.cpp, name whatever you want.
# rm backup.cpp
# cp $1 backup.cpp

# remove all lines containing these keywords
sed -i.cpp '/de()/d' $1
sed -i '/OO/d' $1
sed -i '/cerr/d' $1
sed -i '/local.h/d' $1

sed -i  -r ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' $1
sed -i '/^\s*$/d' $1

# append '//' before all lines containing these keywords
sed -e '/freopen/ s/^#*/\/\//' -i $1

#insert line to the file
ed -s $1 << 'EOF'
0a
# enter the section of files to be inserted in the beginning of the code
.
$a
# enter the section of files to be inserted in the end of the code
.
w
EOF

# get full address using command `readlinf -f file_name`
# sudo ln -sfn `full address of script from previous command` /usr/local/bin/name_of_command