DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  address VARCHAR,
  value INT,
  number_of_bedrooms INT,
  year_built INT,
  let_status BOOLEAN,
  square_footage INT,
  build VARCHAR
);
