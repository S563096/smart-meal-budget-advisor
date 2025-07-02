CREATE TABLE "households" (
  "id" "SERIAL" PRIMARY KEY,
  "name" "VARCHAR",
  "budget" "NUMERIC(10,2)",
  "num_people" "INTEGER",
  "zip_code" "VARCHAR",
  "created_at" "TIMESTAMP"
);

CREATE TABLE "users" (
  "id" "SERIAL" PRIMARY KEY,
  "household_id" "INTEGER",
  "name" "VARCHAR",
  "email" "VARCHAR" UNIQUE,
  "password" "VARCHAR",
  "created_at" "TIMESTAMP"
);

CREATE TABLE "preferences" (
  "id" "SERIAL" PRIMARY KEY,
  "user_id" "INTEGER",
  "food_type" "VARCHAR",
  "meals_per_day" "INTEGER"
);

CREATE TABLE "meals" (
  "id" "SERIAL" PRIMARY KEY,
  "name" "VARCHAR",
  "ingredients" "TEXT",
  "calories" "INTEGER",
  "cost_home" "NUMERIC(10,2)",
  "price_restaurant" "NUMERIC(10,2)",
  "meal_type" "VARCHAR"
);

CREATE TABLE "grocery_items" (
  "id" "SERIAL" PRIMARY KEY,
  "name" "VARCHAR",
  "price" "NUMERIC(10,2)",
  "category" "VARCHAR",
  "store_id" "INTEGER"
);

CREATE TABLE "meal_plans" (
  "id" "SERIAL" PRIMARY KEY,
  "household_id" "INTEGER",
  "week_start" "DATE",
  "total_cost" "NUMERIC(10,2)",
  "meal_plan_data" "JSONB"
);

CREATE TABLE "stores" (
  "id" "SERIAL" PRIMARY KEY,
  "name" "VARCHAR",
  "location" "VARCHAR",
  "zip_code" "VARCHAR"
);

CREATE TABLE "meal_plan_meals" (
  "id" "SERIAL" PRIMARY KEY,
  "meal_plan_id" "INTEGER",
  "meal_id" "INTEGER",
  "day" "INTEGER",
  "person_name" "VARCHAR"
);

CREATE TABLE "meal_ingredients" (
  "id" "SERIAL" PRIMARY KEY,
  "meal_id" "INTEGER",
  "grocery_item_id" "INTEGER",
  "quantity" "VARCHAR"
);

ALTER TABLE "users" ADD FOREIGN KEY ("household_id") REFERENCES "households" ("id");

ALTER TABLE "preferences" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "grocery_items" ADD FOREIGN KEY ("store_id") REFERENCES "stores" ("id");

ALTER TABLE "meal_plans" ADD FOREIGN KEY ("household_id") REFERENCES "households" ("id");

ALTER TABLE "meal_plan_meals" ADD FOREIGN KEY ("meal_plan_id") REFERENCES "meal_plans" ("id");

ALTER TABLE "meal_plan_meals" ADD FOREIGN KEY ("meal_id") REFERENCES "meals" ("id");

ALTER TABLE "meal_ingredients" ADD FOREIGN KEY ("meal_id") REFERENCES "meals" ("id");

ALTER TABLE "meal_ingredients" ADD FOREIGN KEY ("grocery_item_id") REFERENCES "grocery_items" ("id");
