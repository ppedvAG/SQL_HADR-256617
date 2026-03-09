-- Probleme

-- Clusterprüfung: Problem LAN ist isci zugeordnet und kann für den Clsuter
--betrieb nicht verwendet werden
--> eine 3 Netzwerkkarte oder in CLuster- Netzwerk- für Cluster freigeben

--AG:  Im Dienst läßt sich der Punkt AlwaysOn Verfügbarkeitsgruppe aktivieren 
--    nicht aktivieren
--> Neustart

--AG : es läßt sich bei einem Knoten nicht der Assistent für AG starten.
--> Haken aus Aktivierung für AlwaysOn Verfügbarkeitsgruppen raus :		
	-- ok und Neustart des Dienstes
-- und wieder rein. OK.. und Neustart des Dienstes

-- AG auf Modus manuell--> Failover im Cluster Manager scheitert. Im SSMS auf der AG - Gruppe
--> von manuell auf automatisch  setzen

--SQL Dienst Zugriff auf Cluster Service: gMSA Konto läßt sich nicht finden
--> Powershell

