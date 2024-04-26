#la liste des evenement d'une categorie
SELECT e.*
FROM evenement e
JOIN generalize g ON e.evenement_id = g.EVENEMENT_evenement_id
JOIN category c ON g.CATEGORY_category_id = c.category_id
WHERE c.nom = 'Sport';
