/*
  Warnings:

  - You are about to alter the column `file_path` on the `temp_ad` table. The data in that column could be lost. The data in that column will be cast from `String` to `Binary`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_temp_ad" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "data" TEXT NOT NULL,
    "file_path" BLOB NOT NULL
);
INSERT INTO "new_temp_ad" ("data", "file_path", "id") SELECT "data", "file_path", "id" FROM "temp_ad";
DROP TABLE "temp_ad";
ALTER TABLE "new_temp_ad" RENAME TO "temp_ad";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
