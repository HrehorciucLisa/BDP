INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Tuns', 65, 30);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Coafat', 50, 30);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Spalat', 20, 20);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Vopsit', 100, 60);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Manichiura clasica', 60, 40);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Manichiura semi', 100, 60);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Constructie gel', 150, 100);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Tratament Basic', 100, 45);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Machiaj zi', 110, 60);
INSERT INTO servicii (nume, pret, durata_minute)
VALUES ('Machiaj ocazie', 150, 90);



INSERT INTO stilisti(nume)
VALUES ('May Lee');
INSERT INTO detalii_stilisti
VALUES (stilisti_id_stilist_seq.CURRVAL, 'entry-level', '01-JAN-2023', '0723123456', 'may.lee@gmail.com', 'Strada Florilor 12, Iași');

INSERT INTO stilisti(nume)
VALUES ('Ivy Ross');
INSERT INTO detalii_stilisti
VALUES (stilisti_id_stilist_seq.CURRVAL, 'mid-level', '15-FEB-2023', '0723987654', 'ivy.ross@gmail.com', 'Strada Mării 45, Iași');

INSERT INTO stilisti(nume)
VALUES ('Elle Tate');
INSERT INTO detalii_stilisti
VALUES (stilisti_id_stilist_seq.CURRVAL, 'entry-level', '20-MAR-2023', '0721112233', 'elle.tate@gmail.com', 'Strada Soarelui 33, Iași');

-- INSERT INTO stilisti(nume)
-- VALUES ('Joy Quinn');
-- INSERT INTO detalii_stilisti
-- VALUES (stilisti_id_stilist_seq.CURRVAL, 'mid-level', '10-APR-2023', '0723456789', 'joy.quinn@gmail.com', 'Strada Luminii 27, Iași');

-- INSERT INTO stilisti(nume)
-- VALUES ('Eva Novak');
-- INSERT INTO detalii_stilisti
-- VALUES (stilisti_id_stilist_seq.CURRVAL, 'senior-level', '05-MAY-2023', '0723345678', 'eva.novak@gmail.com', 'Strada Verde 9, Iași');



INSERT INTO clienti (nume)
VALUES ('Ina Fox');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722123456', '01-NOV-2023', 'ina.fox@gmail.com', NULL);

INSERT INTO clienti (nume)
VALUES('Mia Lane');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0744112233', '23-NOV-2023', 'mia.lane@gmail.com', NULL);

INSERT INTO clienti (nume)
VALUES('Ava Clark');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0766554433', '14-DEC-2023', NULL, NULL);

INSERT INTO clienti (nume)
VALUES('Zoe Hart');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0733445566', '17-DEC-2024', 'zoe.hart@gmail.com', 'Reactii alergice la vopsea chimica');

INSERT INTO clienti (nume)
VALUES('Eva Cole');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722114455', '3-FEB-2024', NULL, NULL);

INSERT INTO clienti(nume)
VALUES('Nia Davis');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722334455', '01-NOV-2023', 'nia.davis@gmail.com', NULL);

INSERT INTO clienti(nume)
VALUES('Ivy White');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722445566', '02-DEC-2023', 'ivy.white@gmail.com', NULL);

INSERT INTO clienti(nume)
VALUES('Luna Lee');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722556677', '05-OCT-2023', 'luna.lee@gmail.com', NULL);

INSERT INTO clienti(nume)
VALUES('Ria Scott');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722667788', '20-NOV-2023', 'ria.scott@gmail.com', NULL);

INSERT INTO clienti(nume)
VALUES('Ada King');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722778899', '10-NOV-2023', 'ada.king@gmail.com', NULL);

INSERT INTO clienti(nume)
VALUES('Gia Hall');
INSERT INTO detalii_clienti
VALUES (clienti_id_client_seq.CURRVAL, '0722889900', '15-DEC-2023', 'gia.hall@gmail.com', NULL);





INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 8:00','DD-MM-YYYY HH24:MI'), 100000,100,10);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 8:00','DD-MM-YYYY HH24:MI'), 100001,100,11);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 8:00','DD-MM-YYYY HH24:MI'), 100002,100,12);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 8:30', 'DD-MM-YYYY HH24:MI'), 100004,103,12);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 9:00', 'DD-MM-YYYY HH24:MI'), 100001,101,11);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 9:00', 'DD-MM-YYYY HH24:MI'), 100002,102,12);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 10:00', 'DD-MM-YYYY HH24:MI'), 100004,104,12);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 14:00', 'DD-MM-YYYY HH24:MI'), 100003,104,11);

INSERT INTO programari(ora_programare, id_client, id_serviciu, id_stilist)
VALUES (TO_DATE('23-MAR-2027 15:00', 'DD-MM-YYYY HH24:MI'), 100001,100,11);



commit;
