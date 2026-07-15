Hrehorciuc Lisa Maria

Gestionarea programărilor unui salon de frumusețe

- Se consideră că toți stiliștii au același program: luni–vineri, 8:00–16:00, și pot realiza toate serviciile oferite.
- Un client poate avea una sau mai multe programări într-o zi.
- Un stilist poate avea una sau mai multe programări într-o zi.
- Programările nu se pot face în trecut, cu mai mult de un an în viitor sau în afara programului.
- Resursa partajată este stilistul. Funcția func_stilistul_este_disponibil verifică suprapunerea între programări.
- Operațiile CRUD pentru o programare sunt făcute în proceduri: adăugare programare, modificare programare, ștergere programări stilist.




1.	Entitatea clienti:
-	id_client - valoare numerică, cheie primară
-	nume - valoare șir de caractere, obligatorie


2.	Entitatea detalii_clienti:
-	telefon - valoare șir de caractere, obligatorie
-	data_inregistrare – valoare dată, obligatorie
-	mail - valoare șir de caractere, optional
-	comentarii – valoare șir de caractere, optional


3.	Entitatea stilisti:
-	id_stilist - valoare numerică, cheie primară
-	nume - valoare șir de caractere, obligatorie


4.	Entitatea detalii_stilisti:
-	experiență – valoare șir de caractere, obligatorie
-	data_angajare – valoare date, obligatorie
-	telefon - valoare șir de caractere, obligatorie, unică
-	mail - valoare șir de caractere, obligatorie, unică
-	adresa - valoare șir de caractere, optional

5.	Entitate servicii:
-	id_serviciu - valoare numerică, cheie primară
-	nume - valoare șir de caractere, obligatorie, unică
-	pret - valoare numerică, obligatorie
-   durata - valoare numerică, obligatorie


6.	Entitatea programări:
-	id_programare – valoare numerică, cheie primară
-	ora_programare – valoare dată , obligatorie
-	sfarsit_programare – valoare dată , obligatorie


