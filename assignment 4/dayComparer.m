function increasedSubjects = dayComparer(SubjectID, Day1, Day2)
%This function takes in subject ID number and 2 days of performance data.
%It outputs which subjects showed and increase from day one to day two

increased= Day2>Day1;
decreased= Day2<Day1;

increasedSubjects = SubjectID(increased);
end 