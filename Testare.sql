--------------------------------------------
-- Testare trigger
--------------------------------------------

--creare prog. in trecut
-- ORA-20001: EROARE: Prog. nu poate fi facuta in trecut
-- ORA-06512: at "RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE", line 12
-- ORA-04088: error during execution of trigger 'RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE'
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('25-MAY-2026 8:00','DD-MM-YYYY HH24:MI'), 100000,105,14);

--creaza prog. pentru 2100
-- ORA-20001: EROARE: Prog. nu poate fi facuta cu mai mult de 1 an inainte
-- ORA-06512: at "RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE", line 16
-- ORA-04088: error during execution of trigger 'RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE'
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('25-MAY-2100 8:00','DD-MM-YYYY HH24:MI'), 100000,105,14);

-- creare prog. inafara programului
-- ORA-20001: Salonul este deschis intre 8:00 si 16:00
-- ORA-06512: at "RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE", line 8
-- ORA-04088: error during execution of trigger 'RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE'
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE programari
SET ora_programare = TO_DATE('25-MAY-2027 23:55','DD-MM-YYYY HH24:MI')
WHERE id_programare = 1000007;

--creaza prog. in weekend
-- ORA-20001: Salonul este inchis in weekend
-- ORA-06512: at "RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE", line 3
-- ORA-04088: error during execution of trigger 'RO_B369_PLSQL_S06.TRG_VALIDARE_PROGRAMARE'
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('30-May-2026 8:00','DD-MM-YYYY HH24:MI'), 100000,105,14);


--------------------------------------------
-- Vizualizare
--------------------------------------------
-- informatii programare
SELECT p.id_programare,
trunc(p.ora_programare) as zi_programare,
to_char(p.ora_programare,'HH24:MI') as ora_programare ,
to_char(p.sfarsit_programare,'HH24:MI') as sfarsit_programare,
cl.nume as client,
sr.nume as serviciu,
sr.pret,st.nume as stilist
FROM programari p, servicii sr, clienti cl, stilisti st
WHERE p.id_stilist = st.id_stilist and
p.id_serviciu = sr.id_serviciu and
p.id_client = cl.id_client
ORDER BY p.ora_programare;


--------------------------------------------
-- Suprapunerea unei programari
--------------------------------------------
-- ORA-20001: ORA-20001: Nu exista niciun stilist disponibil in acest interval
-- ORA-06512: at "RO_B369_PLSQL_S06.PACKAGE_PROGRAMARI", line 111
-- ORA-06512: at line 2
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
BEGIN
  Package_programari.Proc_adauga_programare(
    p_id_client => 100006,
    p_id_serviciu => 100,
    p_ora_start => TO_DATE('23-MAR-2027 08:00', 'DD-MM-YYYY HH24:MI')
  );
END;
/

--------------------------------------------
-- Adaugare programare
--------------------------------------------
-- Programare adaugata cu succes
-- ID_PROGRAMARE	ZI_PROGRAMARE	ORA_PROGRAMARE	SFARSIT_PROGRAMARE	CLIENT	SERVICIU	PRET	STILIST
-- 1000014	23-Mar-2027	09:00	09:30	Nia Davis	Tuns	65	May Lee

SELECT p.id_programare,
trunc(p.ora_programare) as zi_programare,
to_char(p.ora_programare,'HH24:MI') as ora_programare ,
to_char(p.sfarsit_programare,'HH24:MI') as sfarsit_programare,
cl.nume as client,
sr.nume as serviciu,
sr.pret,st.nume as stilist
FROM programari p, servicii sr, clienti cl, stilisti st
WHERE p.id_stilist = st.id_stilist and
p.id_serviciu = sr.id_serviciu and
p.id_client = cl.id_client and
p.id_client = 100005 and
trunc(p.ora_programare) = DATE '2027-03-23'
ORDER BY p.ora_programare;

BEGIN
  Package_programari.Proc_adauga_programare(
    p_id_client => 100005,
    p_id_serviciu => 100,
    p_ora_start => TO_DATE('23-MAR-2027 09:00', 'DD-MM-YYYY HH24:MI')
  );
END;
/

--------------------------------------------
-- Modificare ora programare
--------------------------------------------
-- Id programare: 1000014
-- Programare modificata cu succes
-- ID_PROGRAMARE	ZI_PROGRAMARE	ORA_PROGRAMARE	SFARSIT_PROGRAMARE	CLIENT	SERVICIU	PRET	STILIST
-- 1000014	23-Mar-2027	12:00	12:30	Nia Davis	Tuns	65	May Lee
DECLARE
  v_id Programari.id_programare%TYPE;
BEGIN
  SELECT id_programare INTO v_id
  FROM Programari
  WHERE id_client = 100005
    AND TRUNC(ora_programare) = DATE '2027-03-23';

  DBMS_OUTPUT.PUT_LINE('Id programare: ' || v_id);

  Package_programari.Proc_modifica_programare(
    p_id_programare => v_id,
    p_ora_noua      => TO_DATE('23-MAR-2027 12:00', 'DD-MM-YYYY HH24:MI')
  );
END;
/

--------------------------------------------
-- Stergere programari stilist
--------------------------------------------
-- BEFORE:
--     ID_PROGRAMARE	ZI_PROGRAMARE	ORA_PROGRAMARE	SFARSIT_PROGRAMARE	CLIENT	SERVICIU	PRET	STILIST
--     1000001	23-Mar-2027	08:00	08:30	Mia Lane	Tuns	65	Ivy Ross
--     1000004	23-Mar-2027	09:00	09:30	Mia Lane	Coafat	50	Ivy Ross
--     1000007	23-Mar-2027	14:00	14:40	Zoe Hart	Manichiura clasica	60	Ivy Ross
--     1000008	23-Mar-2027	15:00	15:30	Mia Lane	Tuns	65	Ivy Ross
-- RUN:
--     Programarea 1000001 stearsa — niciun stilist disponibil
--     Programarea 1000004 reasignata stilistului 10
--     Programarea 1000007 reasignata stilistului 10
--     Programarea 1000008 reasignata stilistului 12
-- AFTER:
--     no data found

SELECT p.id_programare,
trunc(p.ora_programare) as zi_programare,
to_char(p.ora_programare,'HH24:MI') as ora_programare ,
to_char(p.sfarsit_programare,'HH24:MI') as sfarsit_programare,
cl.nume as client,
sr.nume as serviciu,
sr.pret,st.nume as stilist
FROM programari p, servicii sr, clienti cl, stilisti st
WHERE p.id_stilist = st.id_stilist and
p.id_serviciu = sr.id_serviciu and
p.id_client = cl.id_client and
p.id_stilist = 11 and
trunc(p.ora_programare) = DATE '2027-03-23'
ORDER BY p.ora_programare;

BEGIN
  Package_programari.Proc_sterge_prog_stilist(
    p_id_stilist => 11,
    p_zi => DATE '2027-03-23'
  );
END;
/
--------------------------------------------
-- Adaugarea doua programari consecutive pentru un client
--------------------------------------------
-- BEFORE:
--     ID_PROGRAMARE	ORA	SFARSIT	SERVICIU	CLIENT	STILIST
--     1000016	10:00	10:20	Spalat	Nia Davis	Ivy Ross
--     1000017	10:20	10:50	Coafat	Nia Davis	Ivy Ross
--     1000014	12:00	12:30	Tuns	Nia Davis	May Lee
-- RUN:
--     Ambele programari anulateORA-20001: Nu exista niciun stilist disponibil in acest interval
--     ID_PROGRAMARE	ORA	SFARSIT	SERVICIU	CLIENT	STILIST
-- AFTER:
--     1000016	10:00	10:20	Spalat	Nia Davis	Ivy Ross
--     1000017	10:20	10:50	Coafat	Nia Davis	Ivy Ross
--     1000014	12:00	12:30	Tuns	Nia Davis	May Lee

BEGIN
  Package_programari.Proc_adauga_programare(
    p_id_client => 100007,
    p_id_serviciu => 100,
    p_ora_start => TO_DATE('23-MAR-2027 09:00', 'DD-MM-YYYY HH24:MI')
  );
END;
/

SELECT p.id_programare, TO_CHAR(p.ora_programare,'HH24:MI') as ora,
TO_CHAR(p.sfarsit_programare,'HH24:MI') as sfarsit,
sr.nume as serviciu, 
cl.nume as client,st.nume as stilist
FROM Programari p, Servicii sr, Stilisti st, Clienti cl
WHERE p.id_serviciu = sr.id_serviciu AND
p.id_stilist = st.id_stilist AND
p.id_client = cl.id_client AND
p.id_client = 100005 AND
TRUNC(p.ora_programare) = DATE '2027-03-23'
ORDER BY p.ora_programare;

DECLARE
    v_stilist_1 Stilisti.id_stilist%TYPE;
    v_stilist_2 Stilisti.id_stilist%TYPE;
    v_start_prog2 DATE;
    v_id_prog1 Programari.id_programare%TYPE;
BEGIN
    v_stilist_1 := Package_programari.Func_cauta_stilist_liber(
                    102,
                    TO_DATE('23-MAR-2027 08:30', 'DD-MM-YYYY HH24:MI'),
                    NULL);

    INSERT INTO Programari(id_client, id_serviciu, id_stilist, ora_programare)
    VALUES (100005, 102, v_stilist_1,
            TO_DATE('23-MAR-2027 08:30', 'DD-MM-YYYY HH24:MI'));

    SELECT programari_id_programare_seq.CURRVAL 
    INTO v_id_prog1
    FROM DUAL;

    SELECT sfarsit_programare INTO v_start_prog2
    FROM Programari
    WHERE id_programare = v_id_prog1;

    v_stilist_2 := Package_programari.Func_cauta_stilist_liber(
                    101, v_start_prog2, NULL);

    INSERT INTO Programari(id_client, id_serviciu, id_stilist, ora_programare)
    VALUES (100005, 101, v_stilist_2, v_start_prog2);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Ambele programari adaugate cu succes');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Ambele programari anulate' ||SQLERRM);
END;
/
