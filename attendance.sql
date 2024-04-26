#le nombre de personnes présentes à un événement
SELECT COUNT(*) AS number_of_reservations
FROM simplebooking.reservation
WHERE SHOW_show_id = 5;