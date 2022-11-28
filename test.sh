# test


#!/bin/bash
echo "Введите префикс сети"
read pr
echo "Введите подсеть"
read sub
echo "Введите интерфейс"
read int

trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

if ! [[ "$pr" =~ [0-9]+\.[0-9] ]]; then
        echo "error pr"
    exit 1
fi

if ! [[ "$sub" =~ [0-9] ]]; then
        echo "error sub"
    exit 1
fi

if ! [[ "$int" =~ [a-z]+[0-9] ]]; then
        echo "error int"
    exit 1

fi
for HOST in {1..255}
do
        echo "[*] IP : ${pr}.${sub}.${HOST}"
        arping -c 3 -i "$int" "${pr}.${sub}.${HOST}" 2> /dev/null
done

