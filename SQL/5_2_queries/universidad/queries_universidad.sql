USE universidad

--?efectua les següents consultes:

--TODO Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC; 
--TODO Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
--TODO Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
--TODO Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%K";
--TODO Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
--TODO Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = "profesor" ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
--TODO Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre AS asignatura FROM asignatura JOIN alumno_se_matricula_asignatura am ON asignatura.id = am.id_asignatura JOIN curso_escolar ON am.id_curso_escolar = curso_escolar.id JOIN persona ON persona.id = am.id_alumno WHERE persona.nif = "26902806M";
--TODO Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre AS departamento FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN persona pe ON pr.id_profesor = pe.id JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado ON a.id_grado = grado.id WHERE grado.id = 4;
--TODO Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE p.tipo = "alumno" AND ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

--? Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

--TODO Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre, pe.apellido1, pe.apellido2, pe.nombre FROM persona pe LEFT JOIN profesor pr ON pe.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id WHERE pe.tipo = "profesor";
--TODO Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT pe.apellido1, pe.apellido2, pe.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE pe.tipo = "profesor" AND pr.id_departamento IS NULL;
--TODO Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL; 
--TODO Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT pe.nombre, pe.apellido1, pe.apellido2 FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pe.tipo = "profesor" AND a.id_profesor IS NULL;
--TODO Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.nombre AS asignatura FROM asignatura a WHERE id_profesor IS NULL;
--TODO Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura LEFT JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE a.id_profesor IS NULL AND anyo_inicio IS NULL AND anyo_fin IS NULL;

--? Consultes resum

--TODO Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(id) FROM persona WHERE tipo = "alumno";
--TODO Calcula quants alumnes van néixer en 1999.
SELECT COUNT(id) FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
--TODO Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS "Nombre departamento", COUNT(pr.id_profesor) AS `Number professors in dpt.` FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY `Number professors in dpt.` DESC; 
--TODO Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS `Departamento`, COUNT(pr.id_profesor) AS `Number professors in dept.` FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY `Number professors in dept.` DESC;
--TODO Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre AS `grado`, COUNT(a.id) AS `número asignatura` FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY `número asignatura` DESC;
--TODO Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre AS `grado`, COUNT(a.id) AS `número asignaturas` FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING `número asignaturas` > 40;
--TODO Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre `grado`, a.tipo `tipo asignatura`, SUM(a.creditos) `créditos` FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
--TODO Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT ce.anyo_inicio `Año inicio`, SUM(am.id_alumno) AS `número alumnos matriculados` FROM curso_escolar ce JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.anyo_inicio; 
--TODO Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) `número asignaturas`FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN persona pe ON pe.id = pr.id_profesor GROUP BY pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2 ORDER BY `número asignaturas` DESC; 
--TODO Retorna totes les dades de l'alumne/a més jove.
SELECT * FROM persona WHERE tipo = "alumno" ORDER BY fecha_nacimiento ASC LIMIT 1; 
-- Alternative: SELECT * FROM persona WHERE tipo = "alumno" AND fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = "alumno");
--TODO Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
SELECT * FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pe.tipo = "profesor" AND pr.id_departamento IS NOT NULL AND a.id_profesor IS NULL; 