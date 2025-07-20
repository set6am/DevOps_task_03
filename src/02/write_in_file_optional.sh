

function wanna_write_in_file {
echo "Вы хотите записать данные в файл? (Y/N)?"
read line
if [[ $line =~ ^[Yy]$ ]]; then
echo "$1" > $(date +"%d_%m_%Y_%H_%M_%S").status
fi
}