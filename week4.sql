--Week 4 HW

CREATE DATABASE NBA
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default;
       
GRANT ALL ON DATABASE NBA TO postgres;

CREATE TABLE nba_personnel
(
  employee_id integer NOT NULL,
  employee_name character(100),
  team_id integer NOT NULL,
  position_id integer NOT NULL,
  reports_to integer,
  CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);

CREATE TABLE team
(
  team_id integer NOT NULL,
  team_name character(100),
  CONSTRAINT team_pk PRIMARY KEY (team_id)
);


CREATE TABLE positions
(
  position_id character(10) NOT NULL,
  position_name character(100),
  CONSTRAINT position_pk PRIMARY KEY (position_id)
);

INSERT INTO positions(position_id, position_name) VALUES ('c', 'center');
INSERT INTO positions(position_id, position_name) VALUES ('pf', 'power foward');
INSERT INTO positions(position_id, position_name) VALUES ('sf', 'small forward');
INSERT INTO positions(position_id, position_name) VALUES ('pg', 'point guard');
INSERT INTO positions(position_id, position_name) VALUES ('sg', 'shooting guard');
INSERT INTO positions(position_id, position_name) VALUES ('ch', 'coach');
INSERT INTO positions(position_id, position_name) VALUES ('cm', 'commissioner');

INSERT INTO team (team_id, team_name) VALUES ('1', 'Hawks');
INSERT INTO team (team_id, team_name) VALUES ('2', 'Celtics');
INSERT INTO team (team_id, team_name) VALUES ('3', 'Nets');
INSERT INTO team (team_id, team_name) VALUES ('4', 'Hornets');
INSERT INTO team (team_id, team_name) VALUES ('5', 'Bulls');
INSERT INTO team (team_id, team_name) VALUES ('6', 'Cavaliers');
INSERT INTO team (team_id, team_name) VALUES ('7', 'Pistons');
INSERT INTO team (team_id, team_name) VALUES ('8', 'Pacers');
INSERT INTO team (team_id, team_name) VALUES ('9', 'Heat');
INSERT INTO team (team_id, team_name) VALUES ('10', 'Bucks');
INSERT INTO team (team_id, team_name) VALUES ('11', 'Knicks');
INSERT INTO team (team_id, team_name) VALUES ('12', 'Magic');
INSERT INTO team (team_id, team_name) VALUES ('13', '76ers');
INSERT INTO team (team_id, team_name) VALUES ('14', 'Raptors');
INSERT INTO team (team_id, team_name) VALUES ('15', 'Wizards');
INSERT INTO team (team_id, team_name) VALUES ('16', 'Mavericks');
INSERT INTO team (team_id, team_name) VALUES ('17', 'Nuggets');
INSERT INTO team (team_id, team_name) VALUES ('18', 'Warriors');
INSERT INTO team (team_id, team_name) VALUES ('19', 'Rockets');
INSERT INTO team (team_id, team_name) VALUES ('20', 'Clippers');
INSERT INTO team (team_id, team_name) VALUES ('21', 'Lakers');
INSERT INTO team (team_id, team_name) VALUES ('22', 'Grizzlies');
INSERT INTO team (team_id, team_name) VALUES ('23', 'Timberwolves');
INSERT INTO team (team_id, team_name) VALUES ('24', 'Pelicans');
INSERT INTO team (team_id, team_name) VALUES ('25', 'Thunder');
INSERT INTO team (team_id, team_name) VALUES ('26', 'Suns');
INSERT INTO team (team_id, team_name) VALUES ('27', 'Trail Blazers');
INSERT INTO team (team_id, team_name) VALUES ('28', 'Kings');
INSERT INTO team (team_id, team_name) VALUES ('29', 'Spurs');
INSERT INTO team (team_id, team_name) VALUES ('30', 'Jazz');

select * from positions;
commit;
