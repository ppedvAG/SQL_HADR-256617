--DTC Cluster

--weitere Disk erstellen mit Laufwerksbuchstaben

--DTC einrichten

--Rechte für den DTC in Komponenten Dienste

--Firewall

--Zuweisen zur SQL Clsuter Instanz nicht mehr notwendig seit SQL 2016


--! Disk erstelle und im Cluster verfügbar?
--1 DTC als Rolle hinzufügen
--	Name im Netzwerk und IP hinzufügen
--	Disk auswählen

-- 2 Komponenten Services --> Computer--Arbeitsplatz--Clustered DTCs
--   Rechte maus auf DTC Service:--> Sicherheit
		-- Network Access: inboud und outbound
		-- Gegenseitige (mutual) Auth

-- Firewall:
--   Port 135
--   dynamisch 49152-65535


--------------Firewall----------------
# =================================================================
# PowerShell Script: Firewall-Regeln für Distributed Transaction Coordinator (DTC)
# Optimiert für SQL Server Cluster-Umgebungen
# =================================================================

# 1. Erlaube RPC Endpoint Mapper (Port 135)
Write-Host "Erstelle Regel für RPC Endpoint Mapper (TCP 135)..." -ForegroundColor Cyan
New-NetFirewallRule -DisplayName "SQL-DTC-RPC-Mapper" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 135 `
    -Action Allow `
    -Description "Erlaubt den initialen Verbindungsaufbau für DTC-Transaktionen."

# 2. Erlaube den dynamischen RPC-Portbereich (Standard: 49152-65535)
# Dieser Bereich wird vom DTC genutzt, nachdem der Mapper den Port zugewiesen hat.
Write-Host "Erstelle Regel für Dynamische RPC-Ports (49152-65535)..." -ForegroundColor Cyan
New-NetFirewallRule -DisplayName "SQL-DTC-Dynamic-RPC" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 49152-65535 `
    -Action Allow `
    -Description "Erlaubt den Datenaustausch für verteilte Transaktionen über dynamische RPC-Ports."

# 3. Spezifische DTC-Programmregel (Optional aber empfohlen)
# Erlaubt dem msdtc.exe Prozess explizit die Kommunikation
Write-Host "Erstelle Programm-Regel für MSDTC.exe..." -ForegroundColor Cyan
New-NetFirewallRule -DisplayName "SQL-DTC-Process" `
    -Direction Inbound `
    -Program "C:\Windows\System32\msdtc.exe" `
    -Action Allow `
    -Description "Erlaubt dem MSDTC-Prozess die Netzwerkkommunikation."

Write-Host "Firewall-Konfiguration abgeschlossen." -ForegroundColor Green
------------------------------------------------------------------------------

		
