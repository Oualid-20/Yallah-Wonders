<?php
    session_start();
    include("dbConnexion.php");





    if(!isset($_SESSION["user_id"])){
        header("location: ../index.php");
        exit;
    }

    if (!isset($_SESSION['Panier'])) {
        header('location:../shop-filter.php');
        exit;
    }


    if(isset($_GET['adressRue']) && !empty($_GET['adressRue'])) {
        include("functions.php");
        
        htmlspecialchars($_GET['adressRue']);
        
        $adresseLivraison  = $_GET['adressRue'];

        $trackingNumber = generateTrackingNumber();

        $_SESSION["nTracking"]="<div class='alert alert-info alert-dismissible fade show' role='alert'> Votre Track N°=".$trackingNumber."
        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
        </div>";


        $dateCommande = date("Y-m-d H:i:s"); // Récupérer la date actuelle
        $methode= "COD";
        $stmtCommande = $conn->prepare("INSERT INTO COMMANDES (ID, ADRESSE, DATE_COMMANDE, TRACKING, METHODE) VALUES (?, ?, ?, ?, ?)");
        $stmtCommande->bind_param("issss", $_SESSION["user_id"], $adresseLivraison, $dateCommande, $trackingNumber, $methode);
        $stmtCommande->execute();


        require "../vendor/phpmailer/send.php" ;
        envoieMail($_SESSION["user_email"], $trackingNumber);

        $_SESSION['commande_passee'] = false;

        unset($_SESSION['Panier']);
        header('location:../TrackingPage.php');
        exit;

    } else {
        echo "Address not provided";
        header('location:../checkout.php');
        exit;
    }



    if (isset($_SESSION['commande_passee']) && $_SESSION['commande_passee'] === true) {

        header('location:../shop-filter.php');
        exit;
    } else {
        // Marquez la commande comme passée pour éviter qu'elle ne soit insérée à nouveau
        $_SESSION['commande_passee'] = true;
        
        // Insérez le panier dans la table Panier
        $stmtPanier = $conn->prepare("INSERT INTO PANIER (ID, QUANTITE, DATE_CREE) VALUES (?, ?, NOW())");
        $stmtPanier->bind_param("id", $_SESSION["user_id"], $_SESSION["total_general"]);
        $stmtPanier->execute();
        
        // Récupérez l'ID du panier nouvellement créé
        $idPanier = $stmtPanier->insert_id;
        
        // Insérez les enregistrements dans la table inclure
        foreach ($_SESSION['Panier'] as $item) {
            $idProduit = $item['ID_produit'];
            $stmtInclure = $conn->prepare("INSERT INTO INCLURE (ID_PDT, ID_PANIER) VALUES (?, ?)");
            $stmtInclure->bind_param("ii", $idProduit, $idPanier);
            $stmtInclure->execute();
        }
        
        // Redirigez l'utilisateur vers la page de paiement ou une autre page appropriée
        header('location:../checkout.php');
        exit;
    }