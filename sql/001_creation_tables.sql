USE vGourmand;

CREATE TABLE adresse(
    adresse_id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR (50),
    rue VARCHAR (50),
    code_postale VARCHAR (50),
    ville VARCHAR (50),
    pays VARCHAR (50)
);
CREATE TABLE regime(
    regime_id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR (50)
);

CREATE TABLE conditions(
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR (50)
);

CREATE TABLE theme(
    theme_id INT (50) AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR (50)
);

CREATE TABLE menu(
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR (50),
    nombre_personne_minimum INT,
    prix_par_personne DOUBLE,
    regime VARCHAR (50),
    description VARCHAR (255),
    quantite_restante INT,
    regime_id INT,
    condition_id INT,
    theme_id INT,
    FOREIGN KEY (regime_id) REFERENCES regime(regime_id),
    FOREIGN KEY (condition_id) REFERENCES conditions(condition_id),
    FOREIGN KEY (theme_id) REFERENCES theme(theme_id)
);

CREATE TABLE utilisateur(
    utilisateur_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR (50),
    nom VARCHAR (50),
    prenom VARCHAR (50),
    mot_de_passe VARCHAR (255),
    telephone VARCHAR(20),
    adresse_id INT,
    FOREIGN KEY (adresse_id) REFERENCES adresse(adresse_id)
);

CREATE TABLE commande(
    command_id  INT AUTO_INCREMENT PRIMARY KEY,
    date_command DATE,
    date_prestation DATE,
    heure_livraison TIME,
    prix_menu DOUBLE,
    nombre_personne INT,
    prix_livraison DOUBLE,
    statut VARCHAR (50),
    pret_materiel BOOLEAN,
    restitution_materiel BOOLEAN,
    menu_id INT,
    utilisateur_id INT,
    adresse_id INT,
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(utilisateur_id),
    FOREIGN KEY (adresse_id) REFERENCES  adresse(adresse_id)
);

CREATE TABLE plat(
    plat_id INT AUTO_INCREMENT PRIMARY KEY,
    titre_plat VARCHAR (50),
    photo_path VARCHAR (255),
    description VARCHAR (255),
    type VARCHAR (50)
);

CREATE TABLE allergene(
    alergene_id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR (50)
);

CREATE TABLE horaire(
    horaire_id INT AUTO_INCREMENT PRIMARY KEY,
    jour VARCHAR (50),
    heure_ouverture TIME,
    heure_fermeture TIME,
    ferme BOOL DEFAULT 0
);

CREATE TABLE avis(
    avis_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    note TINYINT CHECK ( note BETWEEN 1 AND  5),
    statut VARCHAR(50),
    valide BOOL DEFAULT 0,
    utilisateur_id INT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(utilisateur_id)

);

CREATE TABLE role(
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR (50)
)
