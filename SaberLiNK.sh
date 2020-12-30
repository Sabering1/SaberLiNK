url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Pogresan URL Link. Koristi samo HTTP ili HTTPS.\e[0m"
            exit 1
        fi
    fi
}

echo -n "Postavi svoj Phishing URL ovde. (Sa http ili https ex; https://ZliURL.com): "
read phish
url_checker $phish
sleep 1
echo "Priprema se maskiranje URL-a"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Maskiranje URL-a ###\e[0m"
echo 'Sa cemu da maskiram URL (Sa http ili https), Primer: https://google.com, http
://SlonjaJeTvojBog.org) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nUkucaj neke social engineering reci:(Primer Instagram-Security, Besplatan-Spotify)'
echo -e "\e[31mNemoj da koristis razmak, koristi '-' umesto razmaka u Social Engineering recima\e[0m"
echo -en "\e[32m=>\e[0m "
read words
echo -e "\nPripremam Maskirani URl\n"
final=$mask-$words@$shorter
echo -e "Tvoj maskirani URl:\e[32m ${final} \e[0m\n"
