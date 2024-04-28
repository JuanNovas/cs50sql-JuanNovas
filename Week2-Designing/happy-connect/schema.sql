CREATE TABLE `users`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `school`(
    `id` MEDIUMINT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `type` ENUM ('Primary','Secondary','Higher Education') NOT NULL,
    `location` VARCHAR(30),
    `foundation` SMALLINT CHECK (`foundation` < 2025),
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies`(
    `id` MEDIUMINT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `industry` ENUM ('Technology','Education','Business'),
    `location` VARCHAR(30),
    PRIMARY KEY(`id`)
);

CREATE TABLE `people_conections`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `followed_by` INT UNSIGNED NOT NULL,
    `followed` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`followed_by`) REFERENCES `users`(`id`),
    FOREIGN KEY(`followed`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` MEDIUMINT UNSIGNED NOT NULL,
    `start_affiliation` DATE NOT NULL,
    `end_affiliation` DATE,
    `degree` ENUM ('BA','MA','PhD'),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `school`(`id`)
);

CREATE TABLE `companies_connections`(
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` MEDIUMINT UNSIGNED NOT NULL,
    `start_affiliation` DATE NOT NULL,
    `end_affiliation` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
