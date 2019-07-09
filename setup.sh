#!/bin/sh
# Copyright (c) 2019 Mexious Media.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either version 2
#  of the License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#  (http://www.gnu.org/copyleft/gpl.html)
#
#
#
check_cmd() {
    command -v "$1" >/dev/null 2>&1
}
echo ""
echo ""
cat << "EOF"
   ____            ___  ___  _  ______
  / __/______ ___ / _ \/ _ \/ |/ / __/
 / _// __/ -_) -_) // / // /    /\ \  
/_/ /_/  \__/\__/____/____/_/|_/___/  
                     Copyright (c) 2019                             

EOF
echo "Selamat datang di Installasi VPN Remote FreeDDNS !"
echo ""
echo ""
echo "Checking Software .................................."
sleep 2s
if check_cmd openvpn; then
  echo "OK, OpenVPN Is Installed."
  echo "wait......."
  echo "
else 
  echo "Installing OpenVPN Software"
  sudo apt install openvpn
  echo ""
  echo "Done. waiting...."
  echo ""
  sleep 2s
fi
echo -n "Silahkan Masukan Username VPN yang sudah dibuat: "
read username
echo -n "Silahkan Masukan Password VPN yang sudah dibuat: "
read password
echo ""
echo ""
PS3='Silahkan Pilih lokasi server VPN yang sudah dibuat: '
options=("id-1.hostddns.us" "id-2.hostddns.us" "id-3.hostddns.us" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "id-1.hostddns.us")
            server = "id-1.hostddns.us"
            ;;
        "id-2.hostddns.us")
            server = "id-2.hostddns.us"
            ;;
        "id-3.hostddns.us")
            server = "id-3.hostddns.us"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


echo "Ok, Username $username dan Password $password  dengan server $server berhasil kesimpan"


