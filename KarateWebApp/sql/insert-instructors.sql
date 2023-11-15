
-- inserts the required 5 additional instructors into the NetUser table
INSERT INTO NetUser (UserName, UserPassword, UserType) VALUES
('mrteacher', 'iteach123', 'Instructor'),
('drprofessor', 'drpepper', 'Instructor'),
('vagabond123', 'musashi', 'Instructor'),
('berserkreader', '#1gutsberserkfan', 'Instructor'),
('sensei', 'callmeshihan', 'Instructor');

-- creates records of these users in Instructor table
INSERT INTO Instructor (InstructorID, InstructorFirstName, InstructorLastName, InstructorPhoneNumber) VALUES
(18, 'Guy', 'Teacher', '123-456-7980'),
(19, 'Henry', 'Parker', '770-904-5288'),
(20, 'Earnest', 'Hall', '708-768-4719'),
(21, 'Jessie', 'Rodrigue', '614-279-2580'),
(22, 'Victoria', 'Wilder', '773-517-8243');
