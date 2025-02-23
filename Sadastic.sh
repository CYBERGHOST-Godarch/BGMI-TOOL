echo -e "\e[1;36m @Sadastic_YT \e[0m"
echo
echo -e "\e[1mENTER THE FOLDER PATH TO CLEAR FILES:\e[0m"
read -p "> " target_directory
if [ ! -d "$target_directory" ]; then
echo "THE SPECIFIED FOLDER DOES NOT EXIST."
exit 1
fi
file_count=$(find "$target_directory" -type f | wc -l)
echo -e "\e[1mARE YOU SURE YOU WANT TO NULL $file_count FILES IN $target_directory? (Y/N)\e[0m"
read -r confirmation
confirmation="${confirmation,,}"
if [ "$confirmation" = "y" ]; then
for file in "$target_directory"/*; do
if [ -f "$file" ]; then
: > "$file"
fi
done
echo -e "\e[1;32mDONE\e[0m"
echo
else
echo "OPERATION CANCELLED."
exit 0
fi
echo -e "\e[1mDO YOU WANT TO ADD CUSTOM CREDIT IN FILES? (Y/N)\e[0m"
read -r add_credit
add_credit="${add_credit,,}"
if [ "$add_credit" = "y" ]; then
echo -e "\e[1mENTER THE CUSTOM CREDIT TEXT:\e[0m"
read -p "> " credit_text
for file in "$target_directory"/*; do
if [ -f "$file" ]; then
echo "$credit_text" >> "$file"
fi
done
echo "CREDIT ADDED TO FILES."
echo
else
echo "NO CREDITS ADDED."
echo
fi
