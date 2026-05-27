--BEGIN;
--ALTER TABLE mitglied
--	ADD COLUMN telefon TEXT;
--COMMIT;


BEGIN;

CREATE TABLE buch_neu (
    isbn              TEXT        PRIMARY KEY,
    titel             TEXT        NOT NULL,
    erscheinungsjahr  INTEGER     NOT NULL
                        CHECK (erscheinungsjahr BETWEEN 1450 AND 2100),
    verlag            TEXT        NOT NULL,
    tagesgebuehr      NUMERIC(6,2) NOT NULL CHECK (tagesgebuehr > 0)
);

INSERT INTO buch_neu SELECT * FROM buch;
DROP TABLE buch;
ALTER TABLE buch_neu RENAME TO buch;

SELECT * FROM buch;

COMMIT;


--ALTER TABLE exemplar ALTER COLUMN standort SET DATA TYPE VARCHAR(10);
--Alternativ to this command we would do the same like in task 4b, create a new table, copy data, delete old, rename new
