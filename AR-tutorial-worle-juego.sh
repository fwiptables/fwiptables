#!/bin/bash
##### INICIO ####
#####
#####
caracteres=""
intento="0"
intento_maximo="12"
diccionario_ingles="/usr/share/dict/words"
diccionario_castellano="/usr/share/dict/spanish"
diccionario_escogido="$diccionario_ingles"
grep ^[a-z][a-z][a-z][a-z][a-z]$ $diccionario_escogido > /tmp/wordle_propio.txt
diccionario_preferido="/tmp/wordle_propio.txt"
numero_palabra="$(wc -l $diccionario_preferido | cut -d " "  -f 1)"
numero_aleatorio="$(($RANDOM%$numero_palabra))"
palabra_aleatoria="$(tail -$numero_aleatorio $diccionario_preferido | head -1)"
aleatoria_1="$(echo $palabra_aleatoria | cut -c 1)"
aleatoria_2="$(echo $palabra_aleatoria | cut -c 2)"
aleatoria_3="$(echo $palabra_aleatoria | cut -c 3)"
aleatoria_4="$(echo $palabra_aleatoria | cut -c 4)"
aleatoria_5="$(echo $palabra_aleatoria | cut -c 5)"
####
####
while [ "$intento" -ne "10" ]; do intento="$(($intento+1))"
if [ "$cinco_caracteres" = "$palabra_aleatoria" ]; then  echo "Lo has conseguido, la palabra aleatoria es $palabra_aleatoria" ; exit; fi
if [ "$intento" -gt "$intento_maximo" ]; then echo "Lo has fallado, la palabra aleatoria es $palabra_aleatoria" ; exit ; fi
read -p " Escribe una palabra de cinco caracteres :   " caracteres
cinco_caracteres="$(echo $caracteres | cut -c 1-5)"
caracter_1="$(echo $caracteres | cut -c 1)"
caracter_2="$(echo $caracteres | cut -c 2)"
caracter_3="$(echo $caracteres | cut -c 3)"
caracter_4="$(echo $caracteres | cut -c 4)"
caracter_5="$(echo $caracteres | cut -c 5)"
echo " Palabra introducida actual         :  $cinco_caracteres"
echo " Número de intentos actuales        :  $intento actual de $intento_maximo total"
echo " Letras que coinciden en la palabra : "
if [ "$aleatoria_1" = "$caracter_1" ]; then echo " Letra $aleatoria_1 esta en la palabra"; fi
if [ "$aleatoria_1" = "$caracter_2" ]; then echo " Letra $aleatoria_1 esta en la palabra"; fi
if [ "$aleatoria_1" = "$caracter_3" ]; then echo " Letra $aleatoria_1 esta en la palabra"; fi
if [ "$aleatoria_1" = "$caracter_4" ]; then echo " Letra $aleatoria_1 esta en la palabra"; fi
if [ "$aleatoria_1" = "$caracter_5" ]; then echo " Letra $aleatoria_1 esta en la palabra"; fi
if [ "$aleatoria_2" = "$caracter_1" ]; then echo " Letra $aleatoria_2 esta en la palabra"; fi
if [ "$aleatoria_2" = "$caracter_2" ]; then echo " Letra $aleatoria_2 esta en la palabra"; fi
if [ "$aleatoria_2" = "$caracter_3" ]; then echo " Letra $aleatoria_2 esta en la palabra"; fi
if [ "$aleatoria_2" = "$caracter_4" ]; then echo " Letra $aleatoria_2 esta en la palabra"; fi
if [ "$aleatoria_2" = "$caracter_5" ]; then echo " Letra $aleatoria_2 esta en la palabra"; fi
if [ "$aleatoria_3" = "$caracter_1" ]; then echo " Letra $aleatoria_3 esta en la palabra"; fi
if [ "$aleatoria_3" = "$caracter_2" ]; then echo " Letra $aleatoria_3 esta en la palabra"; fi
if [ "$aleatoria_3" = "$caracter_3" ]; then echo " Letra $aleatoria_3 esta en la palabra"; fi
if [ "$aleatoria_3" = "$caracter_4" ]; then echo " Letra $aleatoria_3 esta en la palabra"; fi
if [ "$aleatoria_3" = "$caracter_5" ]; then echo " Letra $aleatoria_3 esta en la palabra"; fi
if [ "$aleatoria_4" = "$caracter_1" ]; then echo " Letra $aleatoria_4 esta en la palabra"; fi
if [ "$aleatoria_4" = "$caracter_2" ]; then echo " Letra $aleatoria_4 esta en la palabra"; fi
if [ "$aleatoria_4" = "$caracter_3" ]; then echo " Letra $aleatoria_4 esta en la palabra"; fi
if [ "$aleatoria_4" = "$caracter_4" ]; then echo " Letra $aleatoria_4 esta en la palabra"; fi
if [ "$aleatoria_4" = "$caracter_5" ]; then echo " Letra $aleatoria_4 esta en la palabra"; fi
if [ "$aleatoria_5" = "$caracter_1" ]; then echo " Letra $aleatoria_5 esta en la palabra"; fi
if [ "$aleatoria_5" = "$caracter_2" ]; then echo " Letra $aleatoria_5 esta en la palabra"; fi
if [ "$aleatoria_5" = "$caracter_3" ]; then echo " Letra $aleatoria_5 esta en la palabra"; fi
if [ "$aleatoria_5" = "$caracter_4" ]; then echo " Letra $aleatoria_5 esta en la palabra"; fi
if [ "$aleatoria_5" = "$caracter_5" ]; then echo " Letra $aleatoria_5 esta en la palabra"; fi
echo " Letras que coinciden en su sitio   : "
if [ "$aleatoria_1" = "$caracter_1" ]; then echo " Primera letra en su sitio : $caracter_1"; fi
if [ "$aleatoria_2" = "$caracter_2" ]; then echo " Segunda letra en su sitio : $caracter_2"; fi
if [ "$aleatoria_3" = "$caracter_3" ]; then echo " Tercera letra en su sitio : $caracter_3"; fi
if [ "$aleatoria_4" = "$caracter_4" ]; then echo " Cuarta letra en su sitio  : $caracter_4"; fi
if [ "$aleatoria_5" = "$caracter_5" ]; then echo " Quinta letra en su sitio  : $caracter_5"; fi
echo
done
####
####
echo
echo " Tu ultimo intento fue: $cinco_caracteres"
echo " La respuesta correcta: $palabra_aleatoria"
####
####
#### FIN ####
