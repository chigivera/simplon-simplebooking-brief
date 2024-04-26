#modifier les données
UPDATE simplebooking.cart
SET total = (
        SELECT SUM(s.prix)
        FROM simplebooking.reservation AS r
        JOIN simplebooking.show AS s ON r.SHOW_show_id = s.show_id
        WHERE r.CART_cart_id = simplebooking.cart.cart_id
    ),
    reservation_count = (
        SELECT COUNT(*)
        FROM simplebooking.reservation AS r
        WHERE r.CART_cart_id = simplebooking.cart.cart_id
    );
UPDATE simplebooking.paiment p
JOIN (
    SELECT r.CART_cart_id, SUM(s.prix) AS total_amount
    FROM simplebooking.reservation r
    JOIN simplebooking.show s ON r.SHOW_show_id = s.show_id
    GROUP BY r.CART_cart_id
) AS sub ON p.CART_cart_id = sub.CART_cart_id
SET p.montant = sub.total_amount;
