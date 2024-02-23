BORD=$(cat << EndOfMessage

738837120400101COMPLEXE CLTL FLORAC        08112023141120234508112023001000006000002450091120230000000000000000001011202300000000000000000011112023000000000000000000121120230000000000000000001311202300000000000000000014112023000000000000000000
738837120400101LE PIBOULIO   STE CROIX VA 208112023141120234508112023000000000000000000091120230000000000000000001011202300000000000000000011112023000000000000000000121120230010000030000014001311202300000000000000000014112023000000000000000000
738837120400102NUM12022003959CAPITAINES FILMS DU PREAU      01995LES FILMS DU PREAU                 01P000000000500000000001617
738837120400103FLORAC        TF  000059 000060000001004500000000045000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000000000000
738837120400104FLORAC        TR  000265 000270000005004000000000200000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837120400104STE CROIX VA 2TA  001192 001193000001006000000000060000000TR  012916 012918000002004000000000080000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000    000000 000000000000000000000000000000000
738837120400106002000009000000038500947000000036460000000041300000003233000000000000000000000000000003233 0000000161712100000000039000000015781100000000001736P00000001736
738837120400110CINECO                             LA ROUVIERE                        LA PAILLOTE                        SAINT MARTIN DE LANSUSCLE          48110    SAINT MARTIN DE LANSUSCLE          04664594410000000000
738837120400111FLORAC        081120231717000006000002450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
738837120400111STE CROIX VA 2121120231616000003000001400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000



EndOfMessage
)

function parse_type01 {
    record=$1
    echo "      Enseigne:       ${record:0:14}"
    echo "      Ville:          ${record:14:14}"
    echo "      Date de début:  ${record:28:8}"
    echo "      Date de fin:    ${record:36:8}"
    echo "      Semaine:        ${record:44:2}"
    
    offset=46
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Jour:           ${record:($offset):8}"
        offset=$(($offset+8))
        echo "          Nbr séance:     ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Nbr spéctateur: ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          recette:        ${record:($offset):9}"
        offset=$(($offset+9))
    done
    echo "          ---------------------"
}

function parse_type02 {
    record=$1
    offset=0
    echo "      Type de projection:       ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      version du programme:     ${record:($offset):1}"
    offset=$(($offset+1))
    echo "      VISA:                     ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Titre film:               ${record:($offset):25}"
    offset=$(($offset+25))
    echo "      Numero copie:             ${record:($offset):6}"
    offset=$(($offset+6))
    echo "      Code distributeur:        ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Nom distributeur:         ${record:($offset):25}"
    offset=$(($offset+25))
    echo "      Ref Contract:             ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Numéro de condition:      ${record:($offset):2}"
    offset=$(($offset+2))
    echo "      Forfait/Min Garanti:      ${record:($offset):9}"
    offset=$(($offset+9))
    echo "      Taux Location:            ${record:($offset):4}"
    offset=$(($offset+4))
    echo "      Rendement brut partiel:   ${record:($offset):11}"
}

function parse_type03 {
    record=$1
    offset=0
    echo "      Ville:       ${record:($offset):14}"
    offset=$(($offset+14))
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Billet début:    ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Billet fin:      ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Spectateurs:     ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:            ${record:($offset):5}"
        offset=$(($offset+5))
        echo "          Recette:         ${record:($offset):11}"
        offset=$(($offset+11))
        echo "          Taxe spéciale:   ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type04 {
    record=$1
    offset=0
    echo "      Ville:       ${record:($offset):14}"
    offset=$(($offset+14))
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Billet début:   ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Billet fin:     ${record:($offset):7}"
        offset=$(($offset+7))
        echo "          Spectateurs:     ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:            ${record:($offset):5}"
        offset=$(($offset+5))
        echo "          Recette:         ${record:($offset):11}"
        offset=$(($offset+11))
        echo "          Taxe spéciale:   ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type05 {
    record=$1
    offset=0
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Categorie:       ${record:($offset):3}"
        offset=$(($offset+3))
        echo "          Code Famille:    ${record:($offset):3}"
        offset=$(($offset+3))
    done
    echo "          ---------------------"
}

function parse_type06 {
    record=$1
    offset=0
    echo "      Total séance:           ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      Total spéctateur:       ${record:($offset):6}"
    offset=$(($offset+6))
    echo "      Total Guichet:          ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Coef conversion:        ${record:($offset):4}"
    offset=$(($offset+4))
    echo "      Total hors TVA:         ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Total taxe spe:         ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Total hors tout:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Supp location:          ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Prix attraction:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Base film:              ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Groupe Bordereau:       ${record:($offset):1}"
    offset=$(($offset+1))
    echo "      Rendement brut global:  ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Taux recup SACEM:       ${record:($offset):3}"
    offset=$(($offset+3))
    echo "      Recupération SACEM:     ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Facturation hors TVA:   ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Coef multiplicateur:    ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Facturation TVA:        ${record:($offset):11}"
    offset=$(($offset+11))
    echo "      Facturation distrib:    ${record:($offset):12}"
    offset=$(($offset+11))
}


function parse_type08 {
    record=$1
    offset=0
    for i in {1..7}; do
        echo "          ---------------------"
        echo "          Billets:   ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          Prix:    ${record:($offset):5}"
        offset=$(($offset+5))
    done
    echo "          ---------------------"
}

function parse_type09 {
    record=$1
    offset=0
    echo "      Code distributeur:      ${record:($offset):5}"
    offset=$(($offset+5))
    echo "      Commentaire:            ${record:($offset):60}"
    offset=$(($offset+60))
    echo "      Montant:                ${record:($offset):12}"
    offset=$(($offset+12))
}

function parse_type10 {
    record=$1
    offset=0
    echo "      Raison Social:          ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Rue:                    ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Batiment:               ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Localité:               ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Code postal:            ${record:($offset):9}"
    offset=$(($offset+9))
    echo "      Bureau distributeur:    ${record:($offset):35}"
    offset=$(($offset+35))
    echo "      Téléphone:              ${record:($offset):10}"
    offset=$(($offset+10))
    echo "      Fax:                    ${record:($offset):10}"
    offset=$(($offset+10))
}


function parse_type11 {
    record=$1
    echo "      Ville:          ${record:0:14}"
    echo "      Jour:           ${record:14:8}"
    
    offset=22
    for i in {1..10}; do
        echo "          ---------------------"
        echo "          Heure:           ${record:($offset):4}"
        offset=$(($offset+4))
        echo "          Nbr spéctateur: ${record:($offset):6}"
        offset=$(($offset+6))
        echo "          recette:        ${record:($offset):9}"
        offset=$(($offset+9))
    done
    echo "          ---------------------"
}


FIRST=0
while IFS= read -r line
do
    ltrim=`echo $line | sed -e 's/^[[\r\n:space:]]*//'`
    
    if [ "$ltrim" = "" ]; then
      continue;
    fi

    echo "--------------"
    echo "  Numéro de région:       ${line:0:1}"
    echo "  Numéro d'autorisation:  ${line:1:6}"
    echo "  Numéro de manifold:     ${line:7:5}"
    echo "  Type de bordereau:      ${line:12:1}"
    echo "  Taille enregistrement:  ${#line}"

    rec_size=$((${#line}-15))
    line_size=$((${#line}-15))
    case ${line:13:2} in
    "01")
        echo "  Type d'enregistrement:  Résultats par jour (${line:13:2})"
        echo ""
        parse_type01 "${line:15:($rec_size)}"
    ;;
    "02")
        echo "  Type d'enregistrement:  Elément du programme et conditions de location (${line:13:2}) "
        echo ""
        parse_type02 "${line:15:($rec_size)}"
    ;;
    "03")
        echo "  Type d'enregistrement: Détail des séries location (${line:13:2})"
        echo ""
        parse_type03 "${line:15:($rec_size)}"
    ;;
    "04")
        echo "  Type d'enregistrement:  Détail par série de billets (${line:13:2})"
        echo ""
        parse_type04 "${line:15:($rec_size)}"
    ;;
    "05")
        echo "  Type d'enregistrement: Association catégorie | famille (${line:13:2})"
        echo ""
        parse_type05 "${line:15:($rec_size)}"
    ;;
    "06")
        echo "  Type d'enregistrement: Résultats totaux (${line:13:2})"
        echo ""
        parse_type06 "${line:15:($rec_size)}"
    ;;
    "08")
        echo "  Type d'enregistrement: Détail des billets annulés (${line:13:2})"
        echo ""
        parse_type08 "${line:15:($rec_size)}"
    ;;
    "09")
        echo "  Type d'enregistrement: Déduction frais de publicité (${line:13:2})"
        echo ""
        parse_type09 "${line:15:($rec_size)}"
    ;;
    "10")
        echo "  Type d'enregistrement: Adresse de correspondance de la salle (${line:13:2})"
        echo ""
        parse_type10 "${line:15:($rec_size)}"
    ;;
    "11")
        echo "  Type d'enregistrement: Resultat par séance (${line:13:2})"
        echo ""
        parse_type11 "${line:15:($rec_size)}"
    ;;
    esac
    echo ""
done <<< $BORD
