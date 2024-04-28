CREATE INDEX "courses_enrolled" ON "enrollments" ("course_id");
CREATE INDEX "students_enrolled" ON "enrollments" ("student_id");
CREATE INDEX "fall2023_courses" ON "courses" ("id") WHERE "courses"."semester" = 'Fall 2023';
CREATE INDEX "cs_courses" ON "courses" ("id") WHERE "courses"."department" = 'Computer Science';
CREATE INDEX "satisfies_course_id" ON "satisfies" ("course_id");
