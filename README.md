Écrire un programme en Bash qui fonctionne de la manière suivante :

 ./bashDB -w myKey=val file.db
    Va stocker dans le fichier file.db la valeur val
 ./bashDB -r myKey file.db
    Va afficher la valeur associée à la clé "myKey"
 ./bashDB -d myKey file.db
    Va supprimer la clé "myKey" et sa valeur associée

- Si le fichier n'existe pas, le créer.

- Libre à vous de gérer comme vous le voulez les cas où les options ne sont pas bonnes.

- Dans le cas d'une écriture, si la clé existe déjà, on écrase la valeur de la clé.

- N'hésitez pas à être créatif si vous êtes en avance et à ajouter des options bonus (rechercher la valeur et non la clé, chiffrer les données ...)

Exemples en mode non-interactif :

$ ./bashDB.sh -w password=123456 test.db
Writed !

$ ./bashDB.sh -r password test.db
password=123456

$ ./bashDB.sh -w password=1234 test.db
Value updated !

$ ./bashDB.sh -r password test.db
password=1234

$ ./bashDB.sh -d password test.db
Value deleted !

$ ./bashDB.sh -r password test.db
Value not found !


Si on lance ./bashDB avec juste le fichier en paramètre, cela donnera quelque chose comme ça :
(La partie avant les ':' est affichée par votre programme, toute la partie après les ':' est passée par l'utilisateur)


$ ./bashDB.sh test.db
What should I do ? : write password=123456
Writed !

$ ./bashDB.sh test.db
What should I do ? : read password
password=123456

$ ./bashDB.sh test.db
What should I do ? : write password=1234
Value updated !

$ ./bashDB.sh test.db
What should I do ? : read password
password=1234

$ ./bashDB.sh test.db
What should I do ? : delete password
Value deleted !

$ ./bashDB.sh test.db
What should I do ? : read password
Value not found
