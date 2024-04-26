#Inserer les données 
INSERT INTO simplebooking.ville (nom, region) 
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
INSERT INTO simplebooking.evenement (date_de_creation, description)
VALUES 
(CURDATE(), 'GAROU'), -- Assuming 1 is the SHOW_show_id for Garou
(CURDATE(), 'Célébration de la journée mondiale du cancer de l’enfant'), -- Assuming 2 is the SHOW_show_id for Cancer Day
(CURDATE(), 'Bassou "Man-Zakin"'), -- Assuming 3 is the SHOW_show_id for Bassou
(CURDATE(), 'Défilé Jeunes Créateurs'), -- Assuming 4 is the SHOW_show_id for Defile Jeunes Createurs
(CURDATE(), 'De la souffrance à l''espoir'), -- Assuming 5 is the SHOW_show_id for De la souffrance à l'espoir
(CURDATE(), 'Festival Moultak-Art D''Afrique'), -- Assuming 6 is the SHOW_show_id for Festival Moultak-Art D'Afrique
(CURDATE(), 'Festival Gnaoua et Musiques du Monde 2024'), -- Assuming 7 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024
(CURDATE(), 'Hanane Fadili «30 ans de Rire»');
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
INSERT INTO simplebooking.show (image_url, ticket_count, date_de_show, status, date_de_creation, prix, evenement_evenement_id) VALUES 
('https://gcdn.imgix.net/events/garou-escale-a-rabat.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,1),
('https://gcdn.imgix.net/events/garou-escale-a-casablanca.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,1),
('https://gcdn.imgix.net/events/celebration-de-la-journees-mondiale-du-cancer-de-lenfant.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE(), 250,2),
('https://gcdn.imgix.net/events/bassou-man-zakin-a-meknes.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 200,3),
('https://gcdn.imgix.net/events/defile-jeunes-createurs-2.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE(), 400,4),
('https://gcdn.imgix.net/events/de-la-souffrance-a-lespoir.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 450,5),
('https://gcdn.imgix.net/events/festival-moultak-art-dafrique.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE(), 150,6),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-jeudi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 300,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-vendredi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 400,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-3-jours.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 1000,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-samedi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,7),
('https://gcdn.imgix.net/events/hanane-fadili-30-ans-de-rire-a-fes-2.png?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE(), 200,8);
-- Inserting event data into the `acceuillir` table
INSERT INTO simplebooking.acceuillir (VILLE_ville_id, SHOW_show_id)
VALUES 
(1, 1), -- Assuming 1 is the VILLE_ville_id for Rabat and 1 is the SHOW_show_id for Garou : Escale à Rabat
(2, 2), -- Assuming 2 is the VILLE_ville_id for Casablanca and 2 is the SHOW_show_id for Garou : Escale à Casablanca
(2, 3), -- Assuming 1 is the VILLE_ville_id for Rabat and 3 is the SHOW_show_id for Célébration de la journée mondiale du cancer de l’enfant
(7, 4), -- Assuming 3 is the VILLE_ville_id for Meknès and 4 is the SHOW_show_id for Bassou "Man-Zakin" à Meknés
(1, 5), -- Assuming 2 is the VILLE_ville_id for Casablanca and 5 is the SHOW_show_id for Défilé Jeunes Créateurs
(1, 6), -- Assuming 2 is the VILLE_ville_id for Casablanca and 6 is the SHOW_show_id for De la souffrance à l'espoir
(1, 7), -- Assuming 2 is the VILLE_ville_id for Casablanca and 7 is the SHOW_show_id for Festival Moultak-Art D'Afrique
(3, 8), -- Assuming 4 is the VILLE_ville_id for Essaouira and 8 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Jeudi
(3, 9), -- Assuming 4 is the VILLE_ville_id for Essaouira and 9 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Vendredi
(3, 10), -- Assuming 4 is the VILLE_ville_id for Essaouira and 10 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS 3 Jours
(3, 11), -- Assuming 4 is the VILLE_ville_id for Essaouira and 11 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Samedi
(4, 12); -- Assuming 5 is the VILLE_ville_id for Fès and 12 is the SHOW_show_id for Hanane Fadili «30 ans de Rire» à Fés
-- Inserting user data into the `user` table for Moroccan users
INSERT INTO simplebooking.user (email, first_name, last_name, password, age, role)
VALUES 
    ('ali@example.com', 'Ali', 'Benbrahim', 'password123', 28, 'customer'),
    ('fatima@example.com', 'Fatima', 'Zahra', 'abc123', 35, 'customer'),
    ('mohammed@example.com', 'Mohammed', 'Lahcen', 'pass123', 40, 'customer'),
    ('amina@example.com', 'Amina', 'Tazi', 'securepass', 22, 'admin');
INSERT INTO simplebooking.cart (total, reservation_count, USER_user_id)
VALUES 
(0, 0, 1),
(0, 0, 2),
(0, 0, 3);
-- Insert data into the reservation table
INSERT INTO simplebooking.reservation (date_de_reservation, CART_cart_id, SHOW_show_id)
VALUES 
(CURDATE(), 1, 1),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 2),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 4),  -- Assuming the first cart is associated with the first show
(CURDATE(), 2, 2),  -- Assuming the second cart is associated with the second show
(CURDATE(), 2, 4),  -- Assuming the second cart is associated with the second show
(CURDATE(), 2, 5),  -- Assuming the second cart is associated with the second show
(CURDATE(), 3, 5),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 8),  -- Assuming the first cart is associated with the first show
(CURDATE(), 3, 3);  -- Assuming the third cart is associated with the third show
INSERT INTO simplebooking.paiment (montant, date_operation, mode_de_paiment, CART_cart_id, CART_USER_user_id)
VALUES
(100, '2024-04-25 12:00:00', 'Carte de crédit', 1, 1),
(150, '2024-04-26 14:30:00', 'PayPal', 2, 2),
(200, '2024-04-27 10:45:00', 'Virement bancaire', 3, 3);




#Inserer les données 
INSERT INTO simplebooking.ville (nom, region) 
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
INSERT INTO simplebooking.evenement (date_de_creation, description)
VALUES 
(CURDATE(), 'GAROU'), -- Assuming 1 is the SHOW_show_id for Garou
(CURDATE(), 'Célébration de la journée mondiale du cancer de l’enfant'), -- Assuming 2 is the SHOW_show_id for Cancer Day
(CURDATE(), 'Bassou "Man-Zakin"'), -- Assuming 3 is the SHOW_show_id for Bassou
(CURDATE(), 'Défilé Jeunes Créateurs'), -- Assuming 4 is the SHOW_show_id for Defile Jeunes Createurs
(CURDATE(), 'De la souffrance à l''espoir'), -- Assuming 5 is the SHOW_show_id for De la souffrance à l'espoir
(CURDATE(), 'Festival Moultak-Art D''Afrique'), -- Assuming 6 is the SHOW_show_id for Festival Moultak-Art D'Afrique
(CURDATE(), 'Festival Gnaoua et Musiques du Monde 2024'), -- Assuming 7 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024
(CURDATE(), 'Hanane Fadili «30 ans de Rire»');
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
INSERT INTO simplebooking.show (image_url, ticket_count, date_de_show, status, date_de_creation, prix, evenement_evenement_id) VALUES 
('https://gcdn.imgix.net/events/garou-escale-a-rabat.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,1),
('https://gcdn.imgix.net/events/garou-escale-a-casablanca.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,1),
('https://gcdn.imgix.net/events/celebration-de-la-journees-mondiale-du-cancer-de-lenfant.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE(), 250,2),
('https://gcdn.imgix.net/events/bassou-man-zakin-a-meknes.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 200,3),
('https://gcdn.imgix.net/events/defile-jeunes-createurs-2.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 1, CURDATE(), 400,4),
('https://gcdn.imgix.net/events/de-la-souffrance-a-lespoir.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 450,5),
('https://gcdn.imgix.net/events/festival-moultak-art-dafrique.jpeg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE(), 150,6),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-jeudi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 300,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-vendredi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 400,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-3-jours.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 1000,7),
('https://gcdn.imgix.net/events/festival-gnaoua-et-musiques-du-monde-2024-pass-samedi.jpg?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 0, CURDATE(), 500,7),
('https://gcdn.imgix.net/events/hanane-fadili-30-ans-de-rire-a-fes-2.png?w=900&h=600&fit=clip&auto=format,compress&q=80', 0, NOW(), 2, CURDATE(), 200,8);
-- Inserting event data into the `acceuillir` table
INSERT INTO simplebooking.acceuillir (VILLE_ville_id, SHOW_show_id)
VALUES 
(1, 1), -- Assuming 1 is the VILLE_ville_id for Rabat and 1 is the SHOW_show_id for Garou : Escale à Rabat
(2, 2), -- Assuming 2 is the VILLE_ville_id for Casablanca and 2 is the SHOW_show_id for Garou : Escale à Casablanca
(2, 3), -- Assuming 1 is the VILLE_ville_id for Rabat and 3 is the SHOW_show_id for Célébration de la journée mondiale du cancer de l’enfant
(7, 4), -- Assuming 3 is the VILLE_ville_id for Meknès and 4 is the SHOW_show_id for Bassou "Man-Zakin" à Meknés
(1, 5), -- Assuming 2 is the VILLE_ville_id for Casablanca and 5 is the SHOW_show_id for Défilé Jeunes Créateurs
(1, 6), -- Assuming 2 is the VILLE_ville_id for Casablanca and 6 is the SHOW_show_id for De la souffrance à l'espoir
(1, 7), -- Assuming 2 is the VILLE_ville_id for Casablanca and 7 is the SHOW_show_id for Festival Moultak-Art D'Afrique
(3, 8), -- Assuming 4 is the VILLE_ville_id for Essaouira and 8 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Jeudi
(3, 9), -- Assuming 4 is the VILLE_ville_id for Essaouira and 9 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Vendredi
(3, 10), -- Assuming 4 is the VILLE_ville_id for Essaouira and 10 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS 3 Jours
(3, 11), -- Assuming 4 is the VILLE_ville_id for Essaouira and 11 is the SHOW_show_id for Festival Gnaoua et Musiques du Monde 2024 - PASS Samedi
(4, 12); -- Assuming 5 is the VILLE_ville_id for Fès and 12 is the SHOW_show_id for Hanane Fadili «30 ans de Rire» à Fés
-- Inserting user data into the `user` table for Moroccan users
INSERT INTO simplebooking.user (email, first_name, last_name, password, age, role)
VALUES 
    ('ali@example.com', 'Ali', 'Benbrahim', 'password123', 28, 'customer'),
    ('fatima@example.com', 'Fatima', 'Zahra', 'abc123', 35, 'customer'),
    ('mohammed@example.com', 'Mohammed', 'Lahcen', 'pass123', 40, 'customer'),
    ('amina@example.com', 'Amina', 'Tazi', 'securepass', 22, 'admin');
INSERT INTO simplebooking.cart (total, reservation_count, USER_user_id)
VALUES 
(0, 0, 1),
(0, 0, 2),
(0, 0, 3);
-- Insert data into the reservation table
INSERT INTO simplebooking.reservation (date_de_reservation, CART_cart_id, SHOW_show_id)
VALUES 
(CURDATE(), 1, 1),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 2),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 4),  -- Assuming the first cart is associated with the first show
(CURDATE(), 2, 2),  -- Assuming the second cart is associated with the second show
(CURDATE(), 2, 4),  -- Assuming the second cart is associated with the second show
(CURDATE(), 2, 5),  -- Assuming the second cart is associated with the second show
(CURDATE(), 3, 5),  -- Assuming the first cart is associated with the first show
(CURDATE(), 1, 8),  -- Assuming the first cart is associated with the first show
(CURDATE(), 3, 3);  -- Assuming the third cart is associated with the third show
INSERT INTO simplebooking.paiment (montant, date_operation, mode_de_paiment, CART_cart_id, CART_USER_user_id)
VALUES
(100, '2024-04-25 12:00:00', 'Carte de crédit', 1, 1),
(150, '2024-04-26 14:30:00', 'PayPal', 2, 2),
(200, '2024-04-27 10:45:00', 'Virement bancaire', 3, 3);
