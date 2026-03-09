-- gMSA erstellen

--KDS Root Key (einmalig pro Forest):
Add-KdsRootKey -EffectiveTime ((Get-Date).AddHours(-10))

-- Sicherheitsgruppe in Domäne anlegen
-- Name zB:  "SQLClusterNodes" und alle Node Computer hinzufügen

# Nur einmalig pro Domäne nötig (normalerweise dauert das etwas...)
Add-KdsRootKey -EffectiveImmediately

New-ADServiceAccount -Name "gmsa_sql2025" `
    -DNSHostName "gmsa_sql2025.sql.net" `
    -PrincipalsAllowedToRetrieveManagedPassword "SQLClusterNodes" `
    -KerberosEncryptionType AES128, AES256


-- auf den Knoten jeweils in POwersehll oder PS ISE als Admin:
Install-WindowsFeature RSAT-AD-PowerShell

Install-ADServiceAccount -Identity "gmsa_sql2025"
Test-ADServiceAccount -Identity "gmsa_sql2025"

--Konto bei der Installation angeben
SQL\gmsa_sql2025$


--Clusterinstallation:
# Führe dies auf einem Cluster-Knoten als Admin aus
Grant-ClusterAccess -Cluster "NTCLUSTER" -User "sql\gmsa_sql2025$" -Full

