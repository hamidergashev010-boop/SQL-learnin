Nodir, [25.10.2025 17:18]
Easy

Savol:
1. Define the following terms: data, database, relational database, and table.

Javob
- Data (Ma’lumot) — Faktlar, raqamlar, belgilar yoki matnlar ko‘rinishidagi xom axborotlar bo‘lib, ular tahlil qilish orqali ma’no kasb etadi. Ular matn, kuzatuvlar, raqamlar, rasmlar, grafiklar yoki belgilar ko‘rinishida bo‘lishi mumkin. Masalan, ma’lumot sifatida quyidagilar keltirilishi mumkin: narxlar, og‘irliklar, manzillar, yoshlar, ismlar, harorat, sana yoki masofalar.
- Database (Ma’lumotlar bazasi) — Tartiblangan va tizimlashtirilgan ma’lumotlar to‘plami bo‘lib, ularni saqlash, boshqarish va izlash imkonini beradi.
- Relational Database (Aloqador ma’lumotlar bazasi) — Ma’lumotlarni jadval ko‘rinishida, ya’ni ustunlar (kolonkalar) va satrlar (qatorlar) shaklida saqlovchi hamda jadvallar orasida bog‘lanishlar (kalitlar) orqali aloqani ta’minlovchi tizim.
- Table (Jadval) — Ma’lumotlarni strukturaviy saqlash birligi bo‘lib, ustunlar orqali maydonlar, qatorlar orqali yozuvlar ifodalanadi.

Savol:
2. List five key features of SQL Server.

Javob:
- Aloqador (relatsion) ma’lumotlar bazasi tizimi sifatida ishlaydi.
- Foydalanuvchilar uchun qulay bo’lgan interfeys — SQL Server Management Studio (SSMS) orqali boshqariladi.
- Kuchli xavfsizlik tizimi — foydalanuvchi huquqlari va autentifikatsiya.
- Zaxira va tiklash (Backup and Restore) imkoniyatlari mavjud.
- Triggers, Stored Procedures va Functions orqali murakkab amallarni avtomatlashtirish imkonini beradi.

Savol
3. What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

Javob
SQL Server’ga ulanishda mavjud autentifikatsiya turlari:
- Windows autentifikatsiyasi — foydalanuvchi Windows tizimiga kirgan akkaunti orqali kiradi.
- SQL Server autentifikatsiyasi — foydalanuvchi nomi va maxfiy parol orqali alohida kirish amalga oshiriladi.

Medium

Savol
1. Create a new database in SSMS named SchoolDB.

Javob
Create database SchoolDB;

Savol
2. Write and execute a query to create a table called Students with columns: 

Javob
StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).**

Use SchoolDB;
Create table Students (
StudentID int primary key,
Name varchar(50),
Age int
);

Savol
3. Describe the differences between SQL Server, SSMS, and SQL.

Javob
SQL Server, SSMS va SQL o‘rtasidagi farqlar quyidagicha:
- SQL Server: Microsoft tomonidan yaratilgan ma’lumotlar bazasi boshqaruv tizimi.
- SSMS (SQL Server Management Studio): SQL Server bilan ishlash uchun grafik interfeys (GUI) — ya’ni foydalanuvchi oynasi.
- SQL (Structured Query Language): Ma’lumotlar bazasidagi ma’lumotlarni yaratish, o‘zgartirish va so‘rash uchun ishlatiladigan so‘rovlar tili hisoblanadi.

Hard

Savol
1. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

Javob
DQL (Data Query Language - Ma’lumotlarni so‘rash): `Select * from Students; Select * from dbo.Students; • Select Age, count(*) from dbo.Students group by Age;

DML (Data Manipulation Language - Ma’lumotlar ustida amallar (o‘zgartirish, qo‘shish, o‘chirish)): Insert, Update, Delete, insert into dbo.Students values (1,'Sobir',20); update dbo.Students set Age=21 where StudentID=1; delete from dbo.Students where StudentID=3;

DDL (Data Definition Language - Tuzilmalarni yaratish va o‘zgartirish): Create Table, Alter table, Create Table, Alter table dbo.Students add email varchar(100); drop table dbo.Students;

DCL (Data Control Language - Huquqlarni boshqarish): Grant, Revoke, Grant select on dbo.students to [ReaderRole]; revoke insert on dbo.Students from [UserA];

TCL (Transaction Control Language - Tranzaksiyalarni boshqarish): Begin, Commit, Rollback, Begin Tran; update ...; if @@error<>0 rollback; else Commit;

Savol
2. Write a query to insert three records into the Students table.

Javob
Insert into Students (StudentID, Name, Age)
values
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21);

Nodir, [25.10.2025 17:18]
Savol
3. Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
Quyidagi havola orqali .bak faylni yuklab oling:
AdventureWorksDW2022.bak

Javob
1. Faylni C:\Backup\AdventureWorksDW2022.bak manziliga yoki boshqa istalgan manzilga joylashtiramiz.
2. SSMS dasturini ishga tushirib, SQL Server’ga ulanib olamiz.
3. Object Explorer (Обозреватель объектов) oynasida Databases (Базы данных) ustiga sichqonchani o‘ng tugmasini bosgan holda Restore Database (Восстановить базу данных)ni tanlaymiz.
4. Source (Источник) bo‘limidan keyin Device (Устройство) ni belgilaymiz tugmasini bosamiz so'ngra .bak faylni tanlaymiz.
5. Destination (Назначение) bo‘limida yangi baza nomini AdventureWorksDW2022 deb kiritamiz.
6. Files (Файлы) bo‘limida fayllar saqlanadigan manzil to‘g‘riligini tekshiramiz.
7. So‘ngra OK tugmasini bosib, tiklash (restore) (восстановить) jarayonini yakunlaymiz.
