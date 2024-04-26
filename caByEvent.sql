#le chiffre d'affaires par évenement
SELECT e.description AS evenement, SUM(p.montant) AS chiffre_affaires
FROM simplebooking.paiment p
JOIN simplebooking.cart c ON p.CART_cart_id = c.cart_id
JOIN simplebooking.reservation r ON c.cart_id = r.CART_cart_id
JOIN simplebooking.show s ON r.SHOW_show_id = s.show_id
JOIN simplebooking.evenement e ON s.evenement_evenement_id = e.evenement_id
GROUP BY e.description;