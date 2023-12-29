SELECT * FROM producto;
SELECT * FROM fabricante;


-- TODO: 1. Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM producto;
-- TODO: 2. Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM producto;
-- TODO: 3. Llista totes les columnes de la taula producto.
SELECT * FROM producto;
-- TODO: 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, CONCAT(precio, " ", "€") AS "Precio en euros", CONCAT(ROUND(precio * 1.11, 2), " ", "$") AS "Precio en dolares" FROM producto;
-- TODO: 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS "nom de producte", CONCAT(precio, " ", "€") AS "euros", CONCAT(ROUND(precio * 1.11, 2), " ","$") AS "dòlars" FROM producto; 
-- TODO: 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) AS "nombre", precio FROM producto;
-- TODO: 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) AS "nombre", precio FROM producto;
-- TODO: 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, SUBSTR(nombre, 1, 2) FROM fabricante;
-- TODO: 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
-- TODO: 10. Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
-- TODO: 11. Llista el codi dels fabricants que tenen productes en la taula producto.
-- TODO: 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
-- TODO: 13. Llista els noms dels fabricants ordenats de manera ascendent.
-- TODO: 14. Llista els noms dels fabricants ordenats de manera descendent.
-- TODO: 15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
-- TODO: 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
-- TODO: 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
-- TODO: 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
-- TODO: 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
-- TODO: 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
-- TODO: 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- TODO: 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
-- TODO: 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- TODO: 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- TODO: 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- TODO: 26. Retorna una llista de tots els productes del fabricant Lenovo.
-- TODO: 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
-- TODO: 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
-- TODO: 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
-- TODO: 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- TODO: 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- TODO: 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
-- TODO: 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- TODO: 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- TODO: 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- TODO: 36. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- TODO: 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
-- TODO: 38. Llista el nom del producte més car del fabricant Lenovo.
-- TODO: 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- TODO: 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.