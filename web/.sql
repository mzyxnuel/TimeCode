CREATE DATABASE timecode;

CREATE TABLE users(
   id_user INT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   surname VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   psw VARCHAR(100) NOT NULL,
   date DATE NOT NULL,
   CONSTRAINT c_email CHECK(email LIKE '%@%')
);

CREATE TABLE projects(
   id_project INT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE activities(
   id_activity INT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
   date DATE NOT NULL,
   time INT NOT NULL,
   id_user INT UNSIGNED ZEROFILL NOT NULL,
   id_project INT UNSIGNED ZEROFILL NOT NULL,
   id_os INT UNSIGNED ZEROFILL NOT NULL,
   CONSTRAINT fk_user_activity FOREIGN KEY(id_user)
   REFERENCES users(id_user),
   CONSTRAINT fk_project_activity FOREIGN KEY(id_project)
   REFERENCES projects(id_project),
   CONSTRAINT fk_os_activity FOREIGN KEY(id_os)
   REFERENCES oss(id_os)
);

CREATE TABLE languages(
   ext VARCHAR(5) PRIMARY KEY,
   name VARCHAR(100) NOT NULL
);

CREATE TABLE oss(
   id_os INT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL
);

CREATE TABLE users_projects(
   id_user INT UNSIGNED ZEROFILL NOT NULL,
   id_project INT UNSIGNED ZEROFILL NOT NULL,
   CONSTRAINT pk_user_project PRIMARY KEY(id_user, id_project),
   CONSTRAINT fk_user_project FOREIGN KEY(id_user)
   REFERENCES users(id_user),
   CONSTRAINT fk_project_user FOREIGN KEY(id_project)
   REFERENCES projects(id_project)
);

CREATE TABLE projects_languages(
   id_project INT UNSIGNED ZEROFILL NOT NULL,
   ext VARCHAR(5) NOT NULL,
   num_rows INT NOT NULL,
   CONSTRAINT pk_project_language PRIMARY KEY(id_project, ext),
   CONSTRAINT fk_project_language FOREIGN KEY(id_project)
   REFERENCES projects(id_project),
   CONSTRAINT fk_language_project FOREIGN KEY(ext)
   REFERENCES languages(ext)
);

CREATE TABLE activities_languages(
   id_activity INT UNSIGNED ZEROFILL NOT NULL,
   ext VARCHAR(5) NOT NULL,
   modify_rows INT NOT NULL,
   CONSTRAINT pk_activity_language PRIMARY KEY(id_activity, ext),
   CONSTRAINT fk_activity_language FOREIGN KEY(id_activity)
   REFERENCES activities(id_activity),
   CONSTRAINT fk_language_activity FOREIGN KEY(ext)
   REFERENCES languages(ext)
);
