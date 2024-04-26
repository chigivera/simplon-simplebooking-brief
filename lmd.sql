#Inserer les données 
INSERT INTO `simplebooking`.`ville` (`nom`, `region`) 
VALUES 
('Casablanca', 'Casablanca-Settat'),
('Rabat', 'Rabat-Salé-Kénitra'),
('Marrakech', 'Marrakech-Safi'),
('Fes', 'Fès-Meknès'),
('Tangier', 'Tanger-Tétouan-Al Hoceïma'),
('Agadir', 'Souss-Massa'),
('Meknes', 'Fès-Meknès'),
('Oujda', 'Oriental'),
('Kenitra', 'Rabat-Salé-Kénitra'),
('Tetouan', 'Tanger-Tétouan-Al Hoceïma');
INSERT INTO `simplebooking`.`category` (`nom`) 
VALUES 
('Concerts & Festivals'),
('Théâtre & Humour'),
('Formations'),
('Sport'),
('Festival Gnaoua 2024');
-- Assuming SHOW_show_id for each event is known from the `show` table
-- Inserting event names into the `evenement` table
INSERT INTO simplebooking.evenement (date_de_creation, description, SHOW_show_id)
VALUES 
(CURDATE(), 'GAROU', 1), -- Assuming 1 is the SHOW_show_id for Garou
(CURDATE(), 'Célébration de la journée mondiale du cancer de l’enfant', 2), -- Assuming 2 is the SHOW_show_id for Cancer Day
(CURDATE(), 'Bassou "Man-Zakin"', 3), -- Assuming 3 is the SHOW_show_id for Bassou
(CURDATE(), 'Défilé Jeunes Créateurs', 4), -- Assuming 4 is the SHOW_show_id for Defile Jeunes Createurs
(CURDATE(), 'De la souffrance à l''espoir', 5), -- Assuming 5 is the SHOW_show_id for De la souffrance à l'espoir
(CURDATE(), 'Festival Moultak-Art D''Afrique', 6), -- Assuming 6 is the SHOW_show_id for Festival Moultak-Art D'Afrique
(CURDATE(), 'Festival Gnaoua et Musiques du Monde 2024', 7), -- Assuming 7 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024
(CURDATE(), 'Hanane Fadili «30 ans de Rire»', 8);
INSERT INTO simplebooking.generalize (CATEGORY_category_id, EVENEMENT_evenement_id)
VALUES 
(1, 1), -- Assuming 1 is the category_id for Concerts & Festivals and 1 is the evenement_id for GAROU : ESCALE A RABAT
(1, 2), -- Assuming 1 is the category_id for Concerts & Festivals and 2 is the evenement_id for GAROU : ESCALE A CASABLANCA
(2, 3), -- Assuming 2 is the category_id for Théâtre & Humour and 3 is the evenement_id for Bassou "Man-Zakin" à Meknés
(1, 4),
(3, 5),
(4, 6),
(5, 7),
(2, 8);
-- Inserting event data into the `show` table
INSERT INTO simplebooking.show (image_url, ticket_count, date_de_show, status, date_de_creation)
VALUES 
('https://gcdn.imgix.net/events/garou-escale-a-rabat.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/garou-escale-a-casablanca.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/celebration-de-la-journees-mondiale-du-cancer-de-lenfant.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE()), -- Assuming status 1 means 'Annulé'
('https://gcdn.imgix.net/events/bassou-man-zakin-a-meknes.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/defile-jeunes-createurs-2.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE()), -- Assuming status 1 means 'Annulé'
('https://gcdn.imgix.net/events/de-la-souffrance-a-lespoir.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/festival-moultak-art-dafrique.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE()), -- Assuming status 2 means 'Reporté'
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-jeudi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-vendredi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-3-jours.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-samedi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE()), -- Assuming status 0 means 'Épuisé'
('https://gcdn.imgix.net/events/hanane-fadili-30-ans-de-rire-a-fes-2.png?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE()); -- Assuming status 2 means 'Reporté'





#modifier les données
#Supprimer les données
#le chiffre d'affaires d'une année données (ex:2023)
#le chiffre d'affaires par évenement
#les shows passés d'un evenement donnée
#le nombre de personnes présentes à un événement
#la liste des evenement d'une categorie
