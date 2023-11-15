
-- inserts the required 10 additional members into the NetUser table
INSERT INTO NetUser (UserName, UserPassword, UserType) VALUES
('coolguy123', 'thecoolest', 'Member'),
('lameguy321', 'iwishiwascool', 'Member'),
('randomuser', 'randompw', 'Member'),
('Username', 'Password', 'Member'),
('hello', 'world', 'Member'),
('iam', 'running', 'Member'),
('out', 'ofideas', 'Member'),
('billybob', 'ilovetrucks99', 'Member'),
('someuser', 'somepass', 'Member'),
('qwerty', 'asdfg', 'Member');

-- creates records of these users in Member table
INSERT INTO Member (Member_UserID, MemberFirstName, MemberLastName, MemberDateJoined, MemberPhoneNumber, MemberEmail) VALUES
(5, 'Randall', 'Jordan', GETDATE(), '818-889-7705', 'randallrjordan@teleworm.us'),
(6, 'Marsha', 'Allen', GETDATE(), '620-731-9600', 'marshagallen@jourrapide.com'),
(7, 'Mary', 'Hoover', GETDATE(), '907-890-7127', 'mhoover@rhyta.com'),
(8, 'George', 'McMahon', GETDATE(), '281-738-1848', 'gemcmahon@armyspy.com'),
(9, 'Don', 'Duckett', GETDATE(), '218-963-5631', 'donduck@teleworm.us'),
(10, 'Lidia', 'Spears', GETDATE(), '308-935-5125', 'lidspears@dayrep.com'),
(11, 'Floyd', 'Gray', GETDATE(), '702-799-3554', 'floydsgray@rhyta.com'),
(12, 'Lisa', 'Sheehan', GETDATE(), '815-383-5381', 'lisasheenan@teleworm.us'),
(13, 'Perry', 'Minton', GETDATE(), '732-345-0822', 'perryminty@jourrapride.com'),
(14, 'Janice', 'Ward', GETDATE(), '802-430-3949', 'janiward@armyspy.com');
