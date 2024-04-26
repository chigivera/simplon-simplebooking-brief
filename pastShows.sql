#les shows passés d'un evenement donnée
SELECT s.show_id, s.image_url, s.date_de_show, s.prix
FROM simplebooking.show s
JOIN simplebooking.evenement e ON s.evenement_evenement_id = e.evenement_id
WHERE e.description = 'GAROU'
  AND s.date_de_show < CURDATE();
