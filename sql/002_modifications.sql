USE vGourmand;

ALTER TABLE menu DROP COLUMN regime;
ALTER TABLE theme MODIFY COLUMN theme_id INT AUTO_INCREMENT;
ALTER TABLE avis ADD COLUMN command_id INT;
ALTER TABLE avis ADD CONSTRAINT fk_command_id FOREIGN KEY (command_id) REFERENCES commande(command_id) ON DELETE SET NULL;
ALTER TABLE commande RENAME COLUMN prix_menu TO prix_unitaire_snapshot;