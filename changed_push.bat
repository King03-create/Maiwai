set USR_INPUT_STR=
set /P USR_INPUT_STR="please set char : "
git add Maiwai3
git commit -m %USR_INPUT_STR%
git push -u origin master
set /P USR_INPUT_STR="please set char : "