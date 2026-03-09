--Anlegen des Windows FailoverClusters
--Rechte für Installierenden

/* der NT Cluster legt ein Computerkonto in der Domäne an.
Es gibt mehrere Möglichkeiten , damit das auch klappt:
1. Der Installierende hat das Recht Computerkoten in der Domäne anlegen zu dürfen
2. Ein Administrator erstell vorab das Computerkonto mit exakt dem Namen,
	wie der Cluster heißen soll.
	Dann deaktivieren. Beim Setup des Clusters wird das Konto automatisch
	aktiviert.
	Rechte: Das Konto des Installierenden benötigt auf das Konto
			Vollzugriffsrechte.
			Computerkonto-Eigenschaften(erw. Eigenschaften)-Sicherheit
3. Man erstellt eine OU und gibt dem Cluster Installierenden das Recht.	
	OU=SQL-Cluster,DC=firma,DC=local
	Objektverwaltung zuweisen (Delegate)-> benutzedefinierte Aufgabe
	 -> Computer Objekte - Häkchen "Erstellen.:"--> Alle Eigenschaften lesen

--Zeugenfreigabe für den Cluster
--Rechte

--Der Windows Cluster benötigt Zugriffsrechte

--Computerkonto :  DOMÄNE\CLUSTERNAME$ Vollzugriff /Ändern







	
	