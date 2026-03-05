/*

Voraussetzungen:

DB: RecoveryModel: Buld oder höher
LogBackup = LShipping
nur noch JObs für Voll und Diffbackup

SQL Server: ab Std .. Agent!

Umgebung: Domäne wg Freigaben

Ergebnis: lesbare sekundäre DB   1:N
		allerdings mit time lag , er aber selbstbestimmbar ist

evtl Probleme beim Einrichten
--Zugriffe für Agent! 
----> lokale Ordner besitzen imm nur rechte für das Konto MSSQLServer
---->svcAgent und svcSQL haben nicht mal Logins







Lokale Sicherung ist schneller als \\

Wiederherstellungsmodel muss mind maasenprotkoliert sein

AUF HV_SQL1
Backup Log auf C:\_BACKUP
					S

Freigabe auf diese Verzeichnis \\HV-SQL1\_BACKUP

Kopierjob
von \\HV-SQL1\_BACKUP   --> C:\_BACKUP (HV_SQL2)
   L								S


   HV-SQL1: schulung\sqlAgent
   HV-SQL2: schulung\sqlAgent

   Witzigerweise sind die Dienstkontenschulung\svc... nicht als Login vorhanden

   Weil der Zugriff lokal immer mit den NT ServerKonten gemacht wird
   Müssen wir unter anderem dem Konto des Agent der andere Seite ein ZUgriffsrecht geben (Freigabe und NTFS)
   und Vererbung aktivieren

   Ist das Replikat lesefähig, müüssen Clients von der DB geworfen werden, wenn ein Restore kommt..

   Um die sekundäre DB produktiv zu schalten:

   restore database DBName 

   Fertig...

   einen Redirect des Users auf den Sekundären gibts nicht
*/