#!/bin/bash

############ VARIABLE SCRIPT ############
i=0
index0=0
tableau=(' ' 'X' 'O')
reload=0

##################"FONCTIONS ###############
rules(){
clear
echo -n "[+] Bienvenue dans le jeu de Morpion by"
tput cup 2 "$notfound "
echo "[+] Les regles sont connues, les cases sont disposees de la facon suivante : "
echo "
		   1	|   2	|  3	
		________|_______|________
			|	|
		   4	|   5	|  6
		________|_______|________
			|	|	
		   7	|   8	|   9
		"
read -p "[!] Appuyez sur une touche pour lancer la partie"
echo "[...] Chargement de la partie"
sleep 2
}



fonction_test(){
case $index in
	1)	case $choix in
			X|x) 	index0=1 ;;
			O|o)	index0=2 ;;
		esac
		use_index0=1;;

	2)	case $choix in
			X|x) 	index1=1 ;;
			O|o)	index1=2 ;;
		esac
		use_index1=1 ;;
3)	case $choix in
			X|x) 	index2=1 ;;
			O|o)	index2=2 ;;
		esac
		use_index2=1 ;;
4)	case $choix in
			X|x) 	index3=1 ;;
			O|o)	index3=2 ;;
		esac
		use_index3=1 ;;
5)	case $choix in
			X|x) 	index4=1 ;;
			O|o)	index4=2 ;;
		esac
		use_index4=1 ;;
6)	case $choix in
			X|x) 	index5=1 ;;
			O|o)	index5=2 ;;
		esac
		use_index5=1 ;;
7)	case $choix in
			X|x) 	index6=1 ;;
			O|o)	index6=2 ;;
		esac
		use_index6=1 ;;
8)	case $choix in
			X|x) 	index7=1 ;;
			O|o)	index7=2 ;;
		esac
		use_index7=1 ;;
9)	case $choix in
			X|x) 	index8=1 ;;
			O|o)	index8=2 ;;
		esac
		use_index8=1 ;;

	
	*) break ;;


esac
tricherie_avoid
}

tricherie_avoid(){
	if [[use_index0 -eq 1 || use_index1 -eq 1 || use_index2 -eq 1 || use_index3 -eq 1 || use_index4 -eq 1 || use_index5 -eq 1 || use_index6 -eq 1 || use_index7 -eq 1 || use_index8 -eq 1]]
	then
		echo "[!!] Cette case est deja utilisée"
		echo "[!!] Tricher n'apporte rien de bon"
	fi

}


qui_gagne(){
	if [[ $index0 -eq $index1 && $index1 -eq $index2 && $index0 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index0 -eq $index3 && $index3 -eq $index6 && $index0 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index0 -eq $index4 && $index4 -eq $index8 && $index0 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index1 -eq $index4 && $index4 -eq $index7 && $index1 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index2 -eq $index5 && $index5 -eq $index8 && $index2 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index6 -eq $index7 && $index7 -eq $index8 && $index6 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

	if [[ $index3 -eq $index5 && $index5 -eq $index7 && $index3 -ne 0 ]]
	then
		echo "[!!] Le joueur utilisant le symbole ${tableau[index0]} a gagne"
		fin=1
		sleep 3
		regame
	fi

}


regame(){
	if [[ $fin -eq 1 ]]
	then
		read -p "[?] Relancer la partie (Y/N)" reload
		if [[ $reload = Y || $reaload = y ]]
		then
				echo "[...] Reload, please wait "
				sleep 2
				index1=0
				index2=0
				index3=0
				index4=0
				index5=0
				index6=0
				index7=0
				index8=0
				rules
		else
				exit
		fi
	fi
}

########################################
########################################
########## MAIN PROG ###################
###### 
rules
while [[ $choix != q ]]
do
	clear

	modi=$i%2

	if (( $modi != 1 )); then
		echo "
		   ${tableau[$index0]}	|  ${tableau[$index1]}	|  ${tableau[$index2]}	
		________|_______|________
			|	|
		   ${tableau[$index3]}	|  ${tableau[$index4]}	|  ${tableau[$index5]}
		________|_______|________
			|	|	
		   ${tableau[$index6]}	|  ${tableau[$index7]}	|   ${tableau[$index8]}
		"
		qui_gagne
		echo -e "--> Joueur 1 \n"
		read -p "Case (1,2,3,4,5,6,7,8,9) ? " index
		read -p "X ou O ?" choix
		
		let i+=1		
		fonction_test
		
		
	else 
		echo "
		   ${tableau[$index0]}	|  ${tableau[$index1]}	|  ${tableau[$index2]}	
		________|_______|________
			|	|
		   ${tableau[$index3]}	|  ${tableau[$index4]}	|  ${tableau[$index5]}
		________|_______|________
			|	|	
		   ${tableau[$index6]}	|  ${tableau[$index7]}	|   ${tableau[$index8]}
		"
		qui_gagne
		echo -e "--> Joueur 2 \n"
		read -p "Case (1,2,3,4,5,6,7,8,9) ? " index
		read -p "X ou O ?" choix

		let i+=1	
		fonction_test ## CALL OF THE FUNCTION		
	fi
done                                                   
