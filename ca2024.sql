#le chiffre d'affaires d'une année données (ex:2024)
SELECT SUM(montant) AS chiffre_affaires
FROM simplebooking.paiment
WHERE YEAR(date_operation) = 2024;
