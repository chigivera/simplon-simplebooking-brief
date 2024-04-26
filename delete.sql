#Supprimer les données
DELETE FROM simplebooking.reservation WHERE CART_cart_id IN (SELECT cart_id FROM simplebooking.cart WHERE USER_user_id IN (2, 3));
