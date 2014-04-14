CREATE TABLE IF NOT EXISTS talks (
  id int(11) NOT NULL,
  name varchar(100) NOT NULL,
  notes text COMMENT '	',
  starts datetime DEFAULT NULL,
  finishes datetime DEFAULT NULL,
  created datetime DEFAULT NULL,
  updated datetime DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name_UNIQUE (name)
);