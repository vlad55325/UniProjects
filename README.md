# 🏋️ GymDatabase – Projekt bazy danych siłowni

## 🎯 Cel projektu

Celem projektu było zaprojektowanie i stworzenie relacyjnej bazy danych dla siłowni, która umożliwia skuteczne zarządzanie informacjami o klientach, pracownikach, karnetach, sprzęcie i zajęciach grupowych.

Projekt realizowany w ramach zajęć akademickich — nacisk położono na poprawność modelu danych, relacje między tabelami oraz możliwość łatwego generowania raportów w SQL.

---

## 📦 Technologie

- SQL (dialekt MySQL / PostgreSQL)
- ERD (diagram relacji encji – opcjonalnie)

---

## 📁 Struktura projektu

---

## 🧱 Struktura bazy danych

Główne tabele w bazie danych:

- `Clients` – dane klientów siłowni
- `Memberships` – informacje o karnetach
- `Employees` – pracownicy, instruktorzy
- `Equipment` – dostępny sprzęt
- `Classes` – zajęcia grupowe
- `Enrollments` – zapisy klientów na zajęcia

Każda tabela zawiera klucz główny oraz odpowiednie klucze obce zgodnie z zasadami normalizacji (3NF).

---

## 📊 Przykładowe zapytania SQL

```sql
-- Klienci z aktywnym karnetem
SELECT name, surname
FROM Clients
JOIN Memberships ON Clients.membership_id = Memberships.id
WHERE Memberships.end_date > CURRENT_DATE;

-- Najpopularniejsze zajęcia
SELECT class_name, COUNT(*) AS participants
FROM Enrollments
GROUP BY class_name
ORDER BY participants DESC;
